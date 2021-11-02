////  Inject.swift
//  
//
//  Created by Vitaliy Dudin RIT Perm on 23.07.2021.
//  
//

import Foundation

@propertyWrapper
public struct AppCoreInjector<T> {
    private var service: T?
    private var container: AppCore.ServiceLocator? = nil
    
    public var name: String?
    
    public init() {
        self.container = AppCore.ServiceLocator.shared
    }
    
    public init(name: String? = nil, container: AppCore.ServiceLocator? = AppCore.ServiceLocator.shared) {
        self.name = name
        self.container = container
    }
    
    public var wrappedValue: T? {
        mutating get {
            if self.service == nil {
                if self.container == nil {
                    self.container = AppCore.ServiceLocator.shared
                }
                
                self.service = container?.tryGetService(T.self)
            }
            
            return service
        }
        
        mutating set { service = newValue }
    }
    
    public var projectedValue: AppCoreInjector<T> {
        get { return self }
        mutating set { self = newValue }
    }
}
