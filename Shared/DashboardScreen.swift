//
//  DashboardScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
 

struct DashboardScreen: View {
    @ObservedObject var viewModel = ViewModel()
                
    var body: some View {
        NavigationView {
            VStack {
                Text("Custom navigation stack")
                Divider()
                Button(action: {
                    self.viewModel.goToUsers()
                }, label: {
                    Text("Go to users")
                })
            }
            .navigationTitle("Dashboard")
        }
    }
}

extension  DashboardScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService?
        
        func goToUsers() {
            self.router?.dashboardNavigationStack.push(UsersScreen())
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
