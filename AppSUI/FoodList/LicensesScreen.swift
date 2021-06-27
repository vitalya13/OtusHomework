//
//  LicencesScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

struct LicensesScreen: View {    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Welcome! I am Licenses")
            Button {
                router.tabSelection = 0
            } label: {
                Text("Go to Dashboard")
            }
        }
        .navigationTitle("Licenses")
    }
    
}

struct LicensesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LicensesScreen()
    }
}
