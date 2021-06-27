//
//  FoodListScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

struct FoodListScreen: View {
    @EnvironmentObject var router: Router
            
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LazyView(LicensesScreen()), tag: 0, selection: $router.foodListSelection) {
                    Text("Licenses")
                }
                NavigationLink(destination: LazyView(PolicyScreen()), tag: 1, selection: $router.foodListSelection) {
                    Text("Policy")
                }                
            }
            .navigationTitle("FoodList")
        }
    }
}

struct FoodListScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodListScreen()
    }
}
