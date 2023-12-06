//
//  Mock URN.swift
//
//
//  Created by Abdul Muneer Ahmed on 06/12/23.
//

@testable import FindMyIp
import Foundation

extension URN {
    
    func mockData() -> Derived? {
        return nil
    }
    
    func getMockEncodedData() -> Data? {
        return nil
    }
    
    func getMockURLRequest() -> URLRequest? {
        return getURLRequest()
    }
}
