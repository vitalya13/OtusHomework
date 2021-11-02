//
//  LicencesScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

struct LicensesScreen: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome! I am Licenses")
        }
        .navigationTitle("Licenses")
    }
}

extension LicensesScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService!
    }
}

struct LicensesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LicensesScreen()
    }
}
