//
//  BaseURLType.swift
//  
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

import Foundation

/// Enum to represent different types of base URLs
public enum BaseURLType {
    case ipaddress
    
    var value: String {
        switch self {
        case .ipaddress:
            return "https://ipapi.co/json/"
        }
    }
}
