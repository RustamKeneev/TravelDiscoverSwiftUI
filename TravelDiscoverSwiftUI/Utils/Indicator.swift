//
//  Indicator.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 8/5/24.
//

import Foundation
import SwiftUI

struct Indicator: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<6) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 10, height: geometry.size.height / 5)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                        .scaleEffect(self.isAnimating ? 0.6 - CGFloat(index) / 6 : 0.3 + CGFloat(index) / 6)
                        .animation(Animation
                            .timingCurve(0.5, (Double(index) / 6) - 1 / 6, 0.25, 1, duration: 0.7)
                            .repeatForever(autoreverses: false))
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .rotationEffect(.degrees(Double(index) / 6) * 360)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
}
