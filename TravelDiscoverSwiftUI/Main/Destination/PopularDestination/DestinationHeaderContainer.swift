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
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
