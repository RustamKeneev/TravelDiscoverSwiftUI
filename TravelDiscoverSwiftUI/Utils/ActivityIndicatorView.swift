//
//  ActivityIndicatorView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable{
    typealias UIViewType = UIActivityIndicatorView

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
}
