////  SequenceScreen.swift
//  Suffix
//
//  Created by Vitaliy Dudin RIT Perm on 15.08.2021.
//  
//

import SwiftUI

struct SequenceScreen: View {
    @ObservedObject var viewModel: ViewModel
    @State private var pickerIndex = 0
    
    init(text: String) {
        self.viewModel = ViewModel(text: text)
    }
        
    var body: some View {
        VStack {
            Picker("Weather News", selection: self.$pickerIndex) {
                Text("ASC").tag(0)
                Text("DESC").tag(1)
                Text("TOP").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if self.pickerIndex == 0 {
                List(self.viewModel.ascArray) { item in
                    HStack {
                        Text(item)
                        Text("count:\(self.viewModel.count(string: item))")
                    }
                }
            }
            else if self.pickerIndex == 1 {
                List(self.viewModel.descArray) { item in
                    HStack {
                        Text(item)
                        Text("count:\(self.viewModel.count(string: item))")
                    }
                }
            }
            else if self.pickerIndex == 2 {
                List(self.viewModel.topArray) { item in
                    HStack {
                        Text(item)
                        Text("count:\(self.viewModel.count(string: item))")
                    }
                }
            }
        }
    }
}

extension SequenceScreen {
    class ViewModel: ObservableObject {
        var suffixArray: Array<String> = .init()
        
        init(text: String) {
            text.split(separator: " ").forEach { (text) in
                let suffixSequence: SuffixSequence = .init(string: String(text))
                self.suffixArray.append(contentsOf: Array.init(suffixSequence))
            }
        }
        
        var ascArray: [String] {
            Set.init(self.suffixArray)
                .sorted(by: { $0 < $1 })
        }
        
        var descArray: [String] {
            Set.init(self.suffixArray)
                .sorted(by: { $0 > $1 })
        }
        
        var topArray: [String] {
            let arraySlice = self.ascArray
                .filter({ $0.count == 3 })
                .sorted { self.count(string: $0) > self.count(string: $1) }
                .prefix(10)
                
            return Array(arraySlice)
        }
        
        func count(string: String) -> Int {
            self.suffixArray.filter { $0 == string }.count
        }
    }
}

extension String: Identifiable {
    public var id: String { self }    
}
