//
//  TitleModifier.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier{
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(Color("tileBackground"))
            .cornerRadius(6)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: colorScheme == .light ? 1 : 0), radius: 4, x: 0.0, y: 2)
    }
}
