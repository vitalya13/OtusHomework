//
//  Collection.swift
//  AppSUI
//
//  Created by exey on 07.07.2021.
//

import Foundation

extension String: Identifiable {
    
    public var id: String { self }
    
}

extension RandomAccessCollection where Self.Element: Identifiable {
    
    public func isLast<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else {
            return false
        }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
    
}
