//
//  User.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 4/5/24.
//

import Foundation
import SwiftUI

struct User: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
    let followers: Int
    let following: Int
    let posts: [Post]
}
