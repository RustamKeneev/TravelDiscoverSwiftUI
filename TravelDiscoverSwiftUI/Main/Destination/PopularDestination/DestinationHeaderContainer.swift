//
//  ContainerRePresentable.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 9/5/24.
//

import Foundation
import SwiftUI
import UIKit

struct DestinationHeaderContainer: UIViewControllerRepresentable{
    let imageNames: [String]

    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController(imageNames: imageNames)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
