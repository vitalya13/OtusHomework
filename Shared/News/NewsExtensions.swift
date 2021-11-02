////  NewsExtensions.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 14.07.2021.
//  
//

import Foundation
 

extension NewsViewModel {
    typealias News = (city: City, articles: [Article], page: Int, isLoaded: Bool)
}

extension Array where Element == NewsViewModel.News {
    mutating func append(articles: [Article], city: NewsViewModel.City) {
        if let index = self.firstIndex(where: { $0.city == city }) {
            self[index].articles.append(contentsOf: articles)
        }
    }
    
    func isLoading(city: NewsViewModel.City) -> Bool {
        if let index = self.firstIndex(where: { $0.city == city }) {
            return self[index].isLoaded == true
        }
        
        return false
    }
    
    mutating func startLoading(city: NewsViewModel.City) {
        if let index = self.firstIndex(where: { $0.city == city }) {
            self[index].isLoaded = true
        }
    }
    
    mutating func stopLoading(city: NewsViewModel.City) {
        if let index = self.firstIndex(where: { $0.city == city }) {
            self[index].isLoaded = false
        }
    }
    
    mutating func preIncrementingPage(city: NewsViewModel.City) -> Int {
        if let index = self.firstIndex(where: { $0.city == city }) {
            let page: Int = self[index].page
            self[index].page += 1
            
            return page
        }
        
        return 0
    }
    
    func articles(city: NewsViewModel.City) -> [Article] {
        if let index = self.firstIndex(where: { $0.city == city }) {
            return self[index].articles
        }
        
        return []
    }
}

extension Article: Identifiable {
    public var id: String { url }
}

extension NewsViewModel.City: Identifiable {
    public var id: String { String(self.rawValue) }
}
