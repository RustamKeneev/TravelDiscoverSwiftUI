//
//  RestaurantDetails.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation
import SwiftUI

struct RestaurantDetails: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let category: String
    let description: String
    let photos: [Photos]
    let thumbnail: String
    let popularDishes: [Dish]
    let reviews: [Review]
}
