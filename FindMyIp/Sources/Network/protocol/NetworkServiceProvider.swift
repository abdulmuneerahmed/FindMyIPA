//
//  NetworkServiceProvider.swift
//  
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

import Alamofire
import Combine
import Foundation

public protocol NetworkServiceProvider {
    
    associatedtype URNType

    func execute<URNType: URN>(with urnType: URNType) -> AnyPublisher<DataResponse<URNType.Derived, NetworkError>, Never>
}
