//
//  AboutScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI
 

struct AboutScreen: View {
    @ObservedObject var viewModel = ViewModel()
                
    var body: some View {
        NavigationView {
            VStack {
                Button("Show modal screen") {
                    self.viewModel.showModalScreenClick()
                }
                .sheet(isPresented: self.$viewModel.showingSheet) {
                    LazyView(ModalScreen())
                }
            }
            .navigationTitle("About")
        }
    }
}

extension  AboutScreen {
    class ViewModel: ObservableObject {
        @AppCoreInjector var router: AppCore.RouterService!
        @Published var showingSheet = false
        
        func showModalScreenClick() {
            self.showingSheet.toggle()
        }
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
