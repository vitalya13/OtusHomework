////  RouterService.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import Foundation
import NavigationStack

extension AppCore {
    public final class RouterService {
        public var tabSelection: Int = 0
        public var foodListSelection: Int?
        public let dashboardNavigationStack: NavigationStack = .init()
            
        public init() {}
    }
}
