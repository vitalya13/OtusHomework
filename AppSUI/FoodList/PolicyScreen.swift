////  PolicyScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import SwiftUI

struct PolicyScreen: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Welcome! I am Policy")
            Button {
                router.tabSelection = 0
            } label: {
                Text("Go to Dashboard")
            }
        }
        .navigationTitle("Policy")
    }
}

struct PolicyScreen_Previews: PreviewProvider {
    static var previews: some View {
        PolicyScreen()
    }
}
