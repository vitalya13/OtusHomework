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
                VStack {
                    List(self.viewModel.ascArray) { item in
                        HStack {
                            Text(item)
                            Text("count:\(self.viewModel.count(string: item))")
                        }
                    }
                    Button("Test") {
                        self.viewModel.ascArrayTest()
                    }
                    Text(self.viewModel.testValue)
                }
                
            }
            else if self.pickerIndex == 1 {
                VStack {
                    List(self.viewModel.descArray) { item in
                        HStack {
                            Text(item)
                            Text("count:\(self.viewModel.count(string: item))")
                        }
                    }
                    Button("Test") {
                        self.viewModel.descArrayTest()
                    }
                    Text(self.viewModel.testValue)
                }
            }
            else if self.pickerIndex == 2 {
                VStack {
                    List(self.viewModel.topArray) { item in
                        HStack {
                            Text(item)
                            Text("count:\(self.viewModel.count(string: item))")
                        }
                    }
                    Button("Test") {
                        self.viewModel.topArrayTest()
                    }
                    Text(self.viewModel.testValue)
                }
            }
        }
    }
}

extension SequenceScreen {
    class ViewModel: ObservableObject {
        @Published var suffixArray: SuffixSequence
        @Published var testValue: String
        
        init(text: String) {
            self.suffixArray = .init(string: text)
            self.testValue = ""
        }
        
        var ascArray: [String] {
            Set.init(self.suffixArray)
                .sorted(by: { $0 < $1 })
        }
        
        func ascArrayTest() {
            var jobQueue = JobQueue()
            
            jobQueue.add(job: {
                let startDate = Date()
                let _ = self.ascArray
                let endDate = Date()
                
                return endDate.timeIntervalSince(startDate)
            }, completion: { (time) in
                self.testValue = "Time \(time.stringFromTimeInterval())"
            })
                        
            let jobScheduler = JobScheduler(queue: jobQueue, count: 1, qos: .default, completion: {})
            jobScheduler.run()
        }
        
        var descArray: [String] {
            Set.init(self.suffixArray)
                .sorted(by: { $0 > $1 })
        }
        
        func descArrayTest() {
            var jobQueue = JobQueue()
            
            jobQueue.add(job: {
                let startDate = Date()
                let _ = self.descArray
                let endDate = Date()
                
                return endDate.timeIntervalSince(startDate)
            }, completion: { (time) in
                self.testValue = "Time \(time.stringFromTimeInterval())"
            })
                        
            let jobScheduler = JobScheduler(queue: jobQueue, count: 1, qos: .default, completion: {})
            jobScheduler.run()
        }
        
        var topArray: [String] {
            self.ascArray
                .prefix(10)
                .filter({ $0.count == 3 })
                .sorted { self.count(string: $0) < self.count(string: $1) }
        }
        
        func topArrayTest() {
            var jobQueue = JobQueue()
            
            jobQueue.add(job: {
                let startDate = Date()
                let _ = self.topArray
                let endDate = Date()
                
                return endDate.timeIntervalSince(startDate)
            }, completion: { (time) in
                self.testValue = "Time \(time.stringFromTimeInterval())"
            })
                        
            let jobScheduler = JobScheduler(queue: jobQueue, count: 1, qos: .default, completion: {})
            jobScheduler.run()
        }
        
        func count(string: String) -> Int {
            self.suffixArray.filter { $0 == string }.count
        }
    }
}

extension String: Identifiable {
    public var id: String { self }    
}

extension TimeInterval{

        func stringFromTimeInterval() -> String {

            let time = NSInteger(self)

            let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
            let seconds = time % 60
            let minutes = (time / 60) % 60
            let hours = (time / 3600)

            return String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)

        }
    }
