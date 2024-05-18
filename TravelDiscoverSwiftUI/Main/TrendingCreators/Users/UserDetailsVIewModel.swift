//
//  UserDetailsVIewModel.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 18/5/24.
//

import Foundation
import SwiftUI

class UserDetailsVIewModel: ObservableObject{
    @Published var userDetails: User?
    init(userID: Int){
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userID)") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                do{
                    self.userDetails = try? JSONDecoder().decode(User.self, from: data)
                } catch let jsonError{
                    print(jsonError)
                }
                print(data)
            }
        }.resume()
    }
}
