////  TextFieldScreen.swift
//  Suffix
//
//  Created by Vitaliy Dudin RIT Perm on 15.08.2021.
//  
//

import SwiftUI

struct TextFieldScreen: View {
    @State private var txt: String = ""
    @State private var isShowingList = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter text", text: $txt)
                NavigationLink(destination: SequenceScreen(text: self.txt), isActive: $isShowingList) {
                    Text("Show list")
                }                
            }
        }        
    }
}
