//
//  Place.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 6/5/24.
//

import Foundation
import SwiftUI

struct Place: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let thumbnail: String
    let photos: [String]
}
