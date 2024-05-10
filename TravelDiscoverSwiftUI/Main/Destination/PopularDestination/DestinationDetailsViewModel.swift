//
//  DestinationDetailsViewModel.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation
import SwiftUI

class DestinationDetailsViewModel: ObservableObject{
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String) {
        let fixedUrlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fixedUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.destinationDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                    
                } catch {
                    print("Failed to decode JSON,", error)
                }
            }
        }.resume()
    }
}
