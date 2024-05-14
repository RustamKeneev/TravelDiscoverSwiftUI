//
//  RestaurantCarouselView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 14/5/24.
//

import SwiftUI

struct RestaurantCarouselContainer: UIViewControllerRepresentable {
    
    let imageUrlStrings: [String]
    let selectedIndex: Int
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CarouselPageViewController(imageUrlStrings: imageUrlStrings, selectedIndex: selectedIndex)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
