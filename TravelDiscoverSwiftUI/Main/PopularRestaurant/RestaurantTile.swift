//
//  RestaurantTile.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import SwiftUI

struct RestaurantTile: View {
    //MARK: - PROPERTIES
    let restaurant: Restaurant
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 8){
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 60)
                .clipped()
                .padding(.leading, 6)
                .padding(.vertical, 6)
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text(restaurant.name)
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })//: BUTTON
                }//: HSTACK
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.7 • Sushi • $$")
                }//: HSTACK
                Text("title 2")
            }//: VSTACK
            .font(.system(size: 12, weight: .semibold))
            Spacer()
        }//: HSTACK
        .frame(width: 240)
        .asTitle()
    }//: END BODY
}//: END RESTAURANR TILE

//MARK: - PREVIEW
#Preview {
    RestaurantTile(restaurant: .init(id: 1, name: "test", imageName: "tapas"))
}
