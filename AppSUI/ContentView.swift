//
//  ContentView.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
import NavigationStack

struct ContentView: View {    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.tabSelection) {
            NavigationStackView(navigationStack: self.router.dashboardNavigationStack) {
                DashboardScreen()
            }            
            .tabItem {
                Image(systemName: "gift")
                Text("Dashboard")
            }
            .tag(0)
            FoodListScreen()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("FoodList")
                }
                .tag(1)
            AboutScreen()
                .tabItem {
                    Text("About")
                    Image(systemName: "star")
                }
                .tag(2)
            NewsScreen()
                .tabItem {
                    Text("News")
                    Image(systemName: "cloud")
                }
                .tag(3)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
