//
//  Post.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 15/5/24.
//

import Foundation
struct Post: Decodable {
    let title: String
    let imageUrl: String
    let views: String
    let hashtags: [String]
}
