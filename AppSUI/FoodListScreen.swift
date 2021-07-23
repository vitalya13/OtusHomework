//
//  FoodListScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
import AppCore

struct FoodListScreen: View {
    @ObservedObject var viewModel = ViewModel()
            
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LazyView(LicensesScreen())) {
                    Text("Licenses")
                }
                NavigationLink(destination: LazyView(PolicyScreen())) {
                    Text("Policy")
                }                
            }
            .navigationTitle("FoodList")
        }
    }
}

extension FoodListScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService?
        
        var foodListSelection: Binding<Int?> {
            Binding(
                get: {
                    self.router?.foodListSelection
                },
                set: {
                    self.router?.foodListSelection = $0                 
                }
            )
        }
    }
}

struct FoodListScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodListScreen()
    }
}
