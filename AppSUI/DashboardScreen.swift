//
//  DashboardScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
import NavigationStack

struct DashboardScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var navigationStack: NavigationStack
            
    var body: some View {
        NavigationView {
            VStack {
                Text("Custom navigation stack")
                Divider()
                Button(action: {
                    self.navigationStack.push(UsersScreen())
                }, label: {
                    Text("Go to users")
                })
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

extension  DashboardScreen {
    enum ViewDestinations {
        case noDestination
        case users
        case user
        case phones
        case phone
    }
}
