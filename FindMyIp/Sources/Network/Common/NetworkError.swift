//
//  NetworkError.swift
//  
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

import Alamofire
import Foundation

/// Enum to represent different network errors conforming to Error and Equatable protocols
public struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

public struct BackendError: Codable, Error {
    var status: String
    var message: String
}
