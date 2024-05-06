//
//  SomeObservableObjectForUserInterface.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import Foundation
import SwiftUI

class CategoryDetailViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var places = [Place]()
    init(){
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else {return}
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                guard let data = data else {return}
                do{
                    self.places =  try JSONDecoder().decode([Place].self, from: data)
                }catch{
                    
                }
                self.isLoading = false
//                self.places = []
            }//: DISPATCH
        }.resume()
    }
}
