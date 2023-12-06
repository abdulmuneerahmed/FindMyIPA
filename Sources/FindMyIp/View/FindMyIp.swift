//
//  FindMyIp.swift
//  
//
//  Created by Abdul Muneer Ahmed on 05/12/23.
//

import SwiftUI

public struct FindMyIp: View {
    @ObservedObject var ipaViewModel = IPAViewModel()
    public var body: some View {
        VStack {
            conditionalListView()
        }
        .onAppear {
            ipaViewModel.getIPADetails()
        }
    }
    
    @ViewBuilder
    func conditionalListView() -> some View {
        if ipaViewModel.isLoading {
            // Loading state
            ProgressView("Loading...")
        } else if let ipaDetails = ipaViewModel.ipaDetails {
            Text("IP Details: \(ipaDetails.city), \(ipaDetails.countryName)")
        } else if let errorDescription = ipaViewModel.errorDescription {
            // Error state
                Text("Error: \(errorDescription)")
        } else {
            Text("No Data")
        }
    }
}

#Preview {
    FindMyIp()
}
