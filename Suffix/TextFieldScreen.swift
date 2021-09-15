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
    @State private var showShareSheet = true
        
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter text", text: $txt)
                NavigationLink(destination: SequenceScreen(text: self.txt), isActive: $isShowingList) {
                    Text("Show list")
                }
                Button(action: actionSheet) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 36)
                }
            }            
        }
        .onOpenURL { url in
            if url.absoluteString == "widget://link1" {
                
            }
            else if url.absoluteString == "widget://link2" {
                self.isShowingList = true
            }
        }
    }
    
    func actionSheet() {
        let av = UIActivityViewController(activityItems: [ self.txt ], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}
