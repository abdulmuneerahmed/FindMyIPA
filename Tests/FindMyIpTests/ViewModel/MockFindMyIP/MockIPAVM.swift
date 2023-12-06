//
//  File.swift
//  
//
//  Created by Abdul Muneer Ahmed on 06/12/23.
//

@testable import FindMyIp
import Combine
import XCTest

class MockIPAVM: XCTestCase {
    var viewModel: IPAViewModel<MockNetworkService>?
    var cancellable: AnyCancellable?
    
    override func setUp() {
        super.setUp()
        viewModel = IPAViewModel(service: MockNetworkService())
    }
    
    override func tearDown() {
        viewModel = nil
        cancellable = nil
        super.tearDown()
    }
    
    func testFindMyIp() {
        cancellable = viewModel?.service.execute(with: AbstractMockIPAModel()).sink { response in
            switch response.result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}
