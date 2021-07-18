////  UsersScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 18.07.2021.
//  
//

import SwiftUI
import NavigationStack

struct UsersScreen: View {
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.navigationStack.push(UserScreen())
                }, label: {
                    Text("Go to user")
                })
                Divider()
                Button(action: {
                    self.navigationStack.pop()
                }, label: {
                    Text("Make back")
                })
            }
            .navigationTitle("Users")
        }
    }
}

struct UsersScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsersScreen()
    }
}
