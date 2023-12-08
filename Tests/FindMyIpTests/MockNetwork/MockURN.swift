//
//  Mock URN.swift
//
//
//  Created by Abdul Muneer Ahmed on 06/12/23.
//

@testable import FindMyIp
import Foundation

protocol MockURN: URN {
    func mockData() -> Derived?
    func getMockEncodedData() -> Data?
}

extension URN {
    func getMockURLRequest() -> URLRequest? {
        return getURLRequest()
    }
}
