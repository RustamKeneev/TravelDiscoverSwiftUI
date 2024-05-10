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
//        let redVC = UIHostingController(rootView: Text("test"))
//        redVC.view.backgroundColor = .red
//        return redVC
        let pvc = CustomPageViewController()
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
