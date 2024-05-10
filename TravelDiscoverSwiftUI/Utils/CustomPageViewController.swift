//
//  CustomPageViewController.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 10/5/24.
//

import Foundation
import SwiftUI
import UIKit
import Kingfisher

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else {return nil}
        if index == 0 {return nil}
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else {return nil}
        if index == allControllers.count - 1 {return nil}
        return allControllers[index + 1]
    }
    
    var allControllers: [UIViewController] = []
    
    init(imageNames: [String]){
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        allControllers = imageNames.map({ imageName in
            let hostingController = UIHostingController(rootView: KFImage(URL(string: imageName))
                .resizable()
                .scaledToFill()
            )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        if let first = allControllers.first{
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
            self.dataSource = self
            self.delegate = self
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
