//
//  NavigationLazyView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 7/5/24.
//

import Foundation
import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content{
        build()
    }
}
