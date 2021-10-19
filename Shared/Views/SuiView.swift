////  SuiView.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 27.06.2021.
//  
//

import SwiftUI

#if os(iOS)
struct SuiView: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UILabel {
        UILabel()
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
#else

#endif
    
