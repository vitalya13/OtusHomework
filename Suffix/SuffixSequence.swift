////  SuffixSequence.swift
//  Suffix
//
//  Created by Vitaliy Dudin RIT Perm on 15.08.2021.
//  
//

import Foundation

struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> Iterator {
        return Iterator(string: string)
    }
}

extension SuffixSequence {
    struct Iterator: IteratorProtocol {
        let string: String
        var endIndex: String.Index
        
        init(string: String) {
            self.string = string
            self.endIndex = string.endIndex
        }
        
        mutating func next() -> String? {
            guard self.endIndex > self.string.startIndex else { return nil }
            self.endIndex = self.string.index(self.endIndex, offsetBy: -1)
            
            return String(self.string[self.endIndex..<self.string.endIndex])
        }
    }
}
