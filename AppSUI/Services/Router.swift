////  Router.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import Foundation
import SwiftUI
import NavigationStack

// ViewModel
final class Router: ObservableObject {
    @Published var tabSelection: Int = 0
    @Published var foodListSelection: Int?
            
    func showFoodListLicenses() {
        self.tabSelection = 1
        self.foodListSelection = 0
    }
}
