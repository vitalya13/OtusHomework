//
//  FoodListScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
 

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
        @AppCoreInjector var router: AppCore.RouterService!        
    }
}

struct FoodListScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodListScreen()
    }
}
