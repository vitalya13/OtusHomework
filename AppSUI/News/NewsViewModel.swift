////  NewsViewModel.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 14.07.2021.
//  
//

import SwiftUI
import Networking
import AppCore

final class NewsViewModel: ObservableObject {    
    @Published var news = [News]()
    @Published var city: City = .moscow
    @AppCoreInjector var net: AppCore.NetworkingService?
        
    init() {
        NewsViewModel.City.allCases.forEach { (city) in
            news.append((city: city, articles: [], page: 1, isLoaded: false))
        }
    }
    
    func load() {
        guard !self.news.isLoading(city: city) else { return }
                
        self.net?.loadNews(query: city.query, page: self.news.preIncrementingPage(city: city)) { [weak self] (list, error) in
            guard let self = self else { return }
            guard let articles = list?.articles else { return }
            self.news.append(articles: articles, city: self.city)
            self.news.stopLoading(city: self.city)
        }
    }
}

extension NewsViewModel {
    var articles: [Article] { self.news.articles(city: self.city) }
    var isLoading: Bool { self.news.isLoading(city: self.city) }
}
