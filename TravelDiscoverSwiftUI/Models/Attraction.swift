//
//  Attraction.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 9/5/24.
//

import Foundation
import SwiftUI

struct Attraction: Identifiable{
    let id = UUID().uuidString
    let name: String
    let imageName: String
    let latitude: Double
    let longitude: Double
    
}
