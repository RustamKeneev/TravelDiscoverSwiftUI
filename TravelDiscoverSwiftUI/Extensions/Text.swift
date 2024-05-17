//
//  JustifiedTextExtension.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 17/5/24.
//

import Foundation
import SwiftUI

extension Text {
    func justified() -> some View {
        self.modifier(JustifiedText())
    }
}
