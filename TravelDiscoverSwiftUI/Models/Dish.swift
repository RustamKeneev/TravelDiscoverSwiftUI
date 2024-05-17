//
//  Dish.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import Foundation

struct Dish: Decodable, Hashable {
    let name: String
    let price: String
    let numPhotos: Int
    let photo: String
}
