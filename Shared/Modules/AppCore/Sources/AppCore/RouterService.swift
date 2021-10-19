////  RouterService.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import Foundation

#if canImport(NavigationStack)
import NavigationStack
#endif

extension AppCore {
    public final class RouterService {
        public var tabSelection: Int = 0
        public var foodListSelection: Int?
        public let dashboardNavigationStack: NavigationStack = .init()
                    
        public init() {}
    }
}
