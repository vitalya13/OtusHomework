////  NetworkingService.swift
//  
//
//  Created by Vitaliy Dudin RIT Perm on 23.07.2021.
//  
//

import Foundation
import Networking

extension AppCore {
    public final class NetworkingService {
        public init() {}
        
        public func loadNews(query: String, page: Int, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)) {
            ArticlesAPI.everythingGet(q: query, from: "2021-07-01", sortBy: "publishedAt", language: "en", apiKey: "1c0c30a761bb4c7581cab02281a711a5", page: page, completion: completion)
        }
    }
}
