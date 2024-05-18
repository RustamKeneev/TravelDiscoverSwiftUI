//
//  DiscoveryExtensions.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

extension View{
    func asTitle() -> some View{
        modifier(TitleModifier())
    }
}

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
    static let defaultsBackground = Color("defaultBackground")
}
