////  UserScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 18.07.2021.
//  
//

import SwiftUI
import NavigationStack

struct UserScreen: View {
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.navigationStack.push(PhonesScreen())
                }, label: {
                    Text("Go to phones")
                })
                Divider()
                Button(action: {
                    self.navigationStack.pop()
                }, label: {
                    Text("Make back")
                })
            }
            .navigationTitle("User")
        }
    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserScreen()
    }
}
