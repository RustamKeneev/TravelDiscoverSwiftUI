//
//  Review.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 12/5/24.
//

import Foundation

struct Review: Decodable, Hashable {
    let user: ReviewUser
    let rating: Int
    let text: String
}
