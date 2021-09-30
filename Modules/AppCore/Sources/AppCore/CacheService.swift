////  File.swift
//  
//
//  Created by Vitaliy Dudin RIT Perm on 30.09.2021.
//  
//

import Foundation

extension AppCore {
    public final class CacheService {
        public init() {}
        
        public func addToCache<T>(key: String, object: T) where T : Codable {
            if let encoded = try? JSONEncoder().encode(object) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
        
        public func getObjectFromCache<T>(key: String) -> T? where T : Codable {
            if let data = UserDefaults.standard.object(forKey: key) as? Data,
               let object = try? JSONDecoder().decode(T.self, from: data) {
                return object
            }
            
            return nil
        }
    }
}
