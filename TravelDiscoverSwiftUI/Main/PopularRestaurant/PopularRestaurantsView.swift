//
//  PopularRestaurantsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    //MARK: - PROPERTIES
    let restaurants: [Restaurant] = [
        .init(id: 0, name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(id: 1, name: "Bar & Grill", imageName: "bar_grill"),
    ]
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack{
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }//: HSTACK
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(restaurants, id: \.self){ restaurant in
                        NavigationLink(
                            destination: RestaurantDetailsView(restaurant: restaurant),
                            label: {
                                RestaurantTile(restaurant: restaurant)
                                    .foregroundColor(Color(.label))
                            })//: NAVIGATION LINK
                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
                .padding(.bottom)

            }//: SCROLLVIEW
        }//: VSTACK
    }
}

//MARK: - PREVIEW
#Preview {
    PopularRestaurantsView()
}
