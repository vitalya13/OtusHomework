//
//  AppSUIApp.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
import AppCore

@main
struct AppSUIApp: App {
    init() {
        AppCore.ServiceLocator.shared.addService(service: AppCore.RouterService())
        AppCore.ServiceLocator.shared.addService(service: AppCore.NetworkingService())
        AppCore.ServiceLocator.shared.addService(service: AppCore.CacheService())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()                
        }
    }
}
