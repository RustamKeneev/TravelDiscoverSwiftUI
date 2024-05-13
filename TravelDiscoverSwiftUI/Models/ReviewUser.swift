//
//  ReviewUser.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 12/5/24.
//

import Foundation

struct ReviewUser: Decodable, Hashable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
}
