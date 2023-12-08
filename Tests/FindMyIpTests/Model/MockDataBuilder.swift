//
//  File.swift
//  
//
//  Created by Abdul Muneer Ahmed on 09/12/23.
//
@testable import FindMyIp
import Foundation

extension URN {
    func getURNMockEncodedData() -> Data? {
        switch self {
        case let dataModel as AbstractMockIPAModel:
            dataModel.getMockEncodedData()
        default:
            nil
        }
    }
    
    func getURNMockData() -> Derived? {
        if let data = self.getURNMockEncodedData() {
            try? JSONDecoder().decode(Derived.self, from: data)
        } else {
            nil
        }
    }
}
