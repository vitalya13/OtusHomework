////  NewsViewModel.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 14.07.2021.
//  
//

import SwiftUI

final class NewsViewModel: ObservableObject {    
    @Published var news = [News]()
    @Published var city: City = .moscow
    @AppCoreInjector var net: AppCore.NetworkingService!
    @AppCoreInjector var cacheService: AppCore.CacheService!
        
    init() {
        NewsViewModel.City.allCases.forEach { (city) in
            news.append((city: city, articles: [], page: 1, isLoaded: false))
        }
    }
    
    func load() {
        guard !self.news.isLoading(city: city) else { return }
        
        let query = city.query
        let page = self.news.preIncrementingPage(city: city)
        let key = "\(city.id)_\(query)_\(page)"
        
        if let list: ArticleList = self.cacheService.getObjectFromCache(key: key) {
            guard let articles = list.articles else { return }
            self.news.append(articles: articles, city: self.city)
            self.news.stopLoading(city: self.city)
            
            //update cache
            self.net.loadNews(query: query, page: page) { [weak self] (list, error) in
                self?.cacheService.addToCache(key: key, object: list)
            }
        }
        else {
            self.net.loadNews(query: query, page: page) { [weak self] (list, error) in
                guard let self = self else { return }
                guard let articles = list?.articles else { return }
                self.news.append(articles: articles, city: self.city)
                self.news.stopLoading(city: self.city)
                
                //update cache
                self.cacheService.addToCache(key: key, object: list)
            }
        }
        
    }
}

extension NewsViewModel {
    var articles: [Article] { self.news.articles(city: self.city) }
    var isLoading: Bool { self.news.isLoading(city: self.city) }
}
