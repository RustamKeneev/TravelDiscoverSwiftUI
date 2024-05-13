//
//  RestaurantDetailsViewModel.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation
import SwiftUI

class RestaurantDetailsViewModel: ObservableObject{
    @Published var isLoading = true
    @Published var details: RestaurantDetails?

    init(){
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
            }
            
        }.resume()
    }
}
