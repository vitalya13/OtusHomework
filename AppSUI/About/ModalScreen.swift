////  ModalScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 21.06.2021.
//  
//

import SwiftUI
import AppCore

struct ModalScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("I am Modal")          
                }
            }
            .navigationBarTitle("Modal", displayMode: .inline)
            .toolbar {
                Button("Close") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

extension ModalScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService!
    }
}

struct ModalScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModalScreen()
    }
}