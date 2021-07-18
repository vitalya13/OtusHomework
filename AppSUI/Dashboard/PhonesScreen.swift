////  PhonesScreen.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 18.07.2021.
//  
//

import SwiftUI
import NavigationStack

struct PhonesScreen: View {
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.navigationStack.pop()
                }, label: {
                    Text("Make back")
                })
            }
            .navigationTitle("Phones")
        }
    }
}

struct PhonesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PhonesScreen()
    }
}
