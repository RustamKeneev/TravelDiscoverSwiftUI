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
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
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
                                    })
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
                            .background(Color(.init(white:0.9, alpha: 1)))
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            .padding(.bottom)
                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
            }//: SCROLLVIEW
        }//: VSTACK
    }
}

//MARK: - PREVIEW
#Preview {
    PopularRestaurantsView()
}
