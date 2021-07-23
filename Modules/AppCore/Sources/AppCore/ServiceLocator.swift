////  ServiceLocator.swift
//  
//
//  Created by Vitaliy Dudin RIT Perm on 23.07.2021.
//  
//

import Foundation

extension AppCore {
    public final class ServiceLocator {
        public static let shared = ServiceLocator()
        private var services: [String: Any] = [String:Any]()
        
        public func addService<T>(service: T) {
            let name = "\(T.self)"
            services[name] = service
        }
        
        func tryGetService<T: Any>(_ type: T.Type) -> T? {
            let name = "\(type)"
            return services[name] as? T
        }
    }
}
