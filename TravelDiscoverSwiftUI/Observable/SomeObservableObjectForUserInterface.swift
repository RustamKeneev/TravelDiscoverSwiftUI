//
//  SomeObservableObjectForUserInterface.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

class SomeObservableObjectForUserInterface: ObservableObject{
    @Published var isLoading = true
    @Published var places = [Int]()
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.isLoading = false
            self.places = [1,2,3,4,5,6,7,8,9,10]
        }
    }
}
