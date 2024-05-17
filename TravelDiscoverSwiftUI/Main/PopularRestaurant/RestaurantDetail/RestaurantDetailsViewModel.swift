//
//  RestaurantDetailsViewModel.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation
import SwiftUI

class RestaurantDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var restaurant: RestaurantDetails?
    @Published var errorMessage = ""
    
    init(id: Int) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)"
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            self.errorMessage = "Invalid URL"
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status \(statusCode)"
                    return
                }
                guard let data = data else {
                    self.isLoading = false
                    self.errorMessage = "No data"
                    return
                }
                do {
                    self.restaurant = try JSONDecoder().decode(RestaurantDetails.self, from: data)
                } catch {
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
}
