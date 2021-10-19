////  PolicyScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import SwiftUI
import AppCore

struct PolicyScreen: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome! I am Policy")
            Button {
                self.viewModel.goToDashboard()
            } label: {
                Text("Go to Dashboard")
            }
        }
        .navigationTitle("Policy")
    }
}

extension PolicyScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService?
        
        func goToDashboard() {
            guard let router = router else { return }
            router.tabSelection = 0
        }
    }
}

struct PolicyScreen_Previews: PreviewProvider {
    static var previews: some View {
        PolicyScreen()
    }
}
