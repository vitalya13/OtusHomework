////  NewsCity.swift
//  AppSUI
//
//  Created by Vitaliy Dudin RIT Perm on 14.07.2021.
//  
//

import Foundation

extension NewsViewModel {
    enum City: Int, CaseIterable {
        case moscow
        case newYork
        case london
        
        var title: String {
            switch self {
            case .moscow:
                return "Moscow"
            case .newYork:
                return "New York"
            case .london:
                return "London"
            }
        }
        
        var query: String {
            switch self {
            case .moscow:
                return "Moscow weather"
            case .newYork:
                return "New York weather"
            case .london:
                return "London weather"
            }
        }
    }
}
