//
//  DashboardScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

struct DashboardScreen: View {
    @EnvironmentObject var router: Router
        
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome! I am dashboard")
                Divider()
                Button {
                    self.router.tabSelection = 1
                } label: {
                    Text("Go to FoodList")
                }
                Divider()
                Button {
                    self.router.showFoodListLicenses()
                } label: {
                    Text("Go to FoodList Licenses")
                }                
                Divider()
                SuiView(text: "Hello suiView UIViewRepresentable")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                Spacer()
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
