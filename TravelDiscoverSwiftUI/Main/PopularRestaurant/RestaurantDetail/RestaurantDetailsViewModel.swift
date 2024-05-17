//
//  RestaurantDetailsViewModel.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation
import SwiftUI

//class RestaurantDetailsViewModel: ObservableObject {
//    @Published var isLoading = true
//    @Published var details: RestaurantDetails?
//    @Published var errorMessage: String?
//
//    init(name: String) {
//        fetchDetails(for: name)
//    }
//
//    private func fetchDetails(for name: String) {
//        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(name.lowercased())"
//        guard let url = URL(string: urlString) else {
//            self.errorMessage = "Invalid URL"
//            self.isLoading = false
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { [weak self] (data, resp, err) in
//            guard let self = self else { return }
//            
//            if let err = err {
//                DispatchQueue.main.async {
//                    self.errorMessage = "Failed to fetch data: \(err.localizedDescription)"
//                    self.isLoading = false
//                }
//                return
//            }
//            
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    self.errorMessage = "No data received"
//                    self.isLoading = false
//                }
//                return
//            }
//            
//            do {
//                let details = try JSONDecoder().decode(RestaurantDetails.self, from: data)
//                DispatchQueue.main.async {
//                    self.details = details
//                    self.isLoading = false
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
//                    self.isLoading = false
//                }
//            }
//        }.resume()
//    }
//}


import Foundation

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
