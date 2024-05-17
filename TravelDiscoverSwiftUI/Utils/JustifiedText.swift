//
//  JustifiedText.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 17/5/24.
//

import Foundation
import SwiftUI

struct JustifiedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}
