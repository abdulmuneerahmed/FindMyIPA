//
//  NetworkService.swift
//
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

import Alamofire
import Combine
import Foundation

public struct NetworkService: NetworkServiceProvider {
    
    public typealias URNType = URN
    
    public func execute<URNType>(with urnType: URNType) -> AnyPublisher<DataResponse<URNType.Derived, NetworkError>, Never> where URNType: URN {
        return AF.request(urnType.baseURLType.value, method: urnType.method)
            .validate()
            .publishDecodable(type: URNType.Derived.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

