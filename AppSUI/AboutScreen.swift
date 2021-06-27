//
//  AboutScreen.swift
//  AppSUI
//
//  Created by exey on 16.06.2021.
//

import SwiftUI

struct AboutScreen: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Show modal screen") {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    LazyView(ModalScreen())
                }
            }
            .navigationTitle("About")
        }
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
