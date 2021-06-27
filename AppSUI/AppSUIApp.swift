//
//  AppSUIApp.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

@main
struct AppSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
        }
    }
}
