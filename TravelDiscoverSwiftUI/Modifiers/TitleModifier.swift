//
//  TitleModifier.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(6)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x:0.0, y:2)
    }
}
