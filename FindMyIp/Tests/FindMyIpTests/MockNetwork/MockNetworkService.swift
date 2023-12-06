//
//  MockNetworkService.swift
//
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

@testable import FindMyIp
import Alamofire
import Combine
import Foundation

struct MockNetworkService: NetworkServiceProvider {
    typealias URNType = URN
    private let delayInSeconds = 2.0
    
    func execute<URNType>(with urnType: URNType) -> AnyPublisher<DataResponse<URNType.Derived, NetworkError>, Never> where URNType : URN {
        let subject = PassthroughSubject<DataResponse<URNType.Derived, NetworkError>, Never>()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + delayInSeconds) {
            
            let result: Result<URNType.Derived, NetworkError> = getMockResult(mockData: urnType)
            let response = DataResponse<URNType.Derived, NetworkError>(
                request: urnType.getMockURLRequest(),
                response: HTTPURLResponse(),
                data: urnType.getMockEncodedData(),
                metrics: nil,
                serializationDuration: 0.0,
                result: result
            )
            subject.send(response)
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
    
    private func getMockResult<T: URN>(mockData: T) -> Result<T.Derived, NetworkError>{
        if let data = mockData.mockData() {
            return .success(data)
        } else {
            return .failure(NetworkError(initialError: .explicitlyCancelled, backendError: BackendError(status: "404", message: "No Data Found")))
        }
    }
}
