//
//  LicencesScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
import AppCore

struct LicensesScreen: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome! I am Licenses")
            Button {
                self.viewModel.goToDashboard()
            } label: {
                Text("Go to Dashboard")
            }
        }
        .navigationTitle("Licenses")
    }
}

extension LicensesScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService?
        
        func goToDashboard() {
            guard let router = router else { return }
            router.tabSelection = 0
        }
    }
}

struct LicensesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LicensesScreen()
    }
}
