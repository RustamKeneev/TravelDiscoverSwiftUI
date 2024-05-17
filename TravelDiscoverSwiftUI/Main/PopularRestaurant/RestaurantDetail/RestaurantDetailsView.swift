//
//  RestaurantDetailsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm: RestaurantDetailsViewModel

    let restaurant: Restaurant
    
    init(restaurant: Restaurant){
        self.restaurant = restaurant
        self.vm = .init(id: restaurant.id)
    }

    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomLeading){
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            ForEach(0..<5,id: \.self){ num in
                                Image(systemName: "star.fill")
                            }//: LOOP
                            .foregroundColor(.orange)
                        }//: HSTACK
                    }//: VSTACK
                    Spacer()
                    NavigationLink {
                        RestaurantPhotosView()
                    } label: {
                        Text("See more photos")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 80)
                            .multilineTextAlignment(.trailing)
                    }//: NAVIGATION LINK
                }//: HSTACK
                .padding()
            }//: ZSTACK

            LocationDescriptionView(vm: vm)
            if let dishes = vm.restaurant?.popularDishes {
                PopularDishesView(dishes: dishes)
            }

            if let reviews = vm.restaurant?.reviews {
                CustomerReviewsVIew(reviews: reviews)
            }//: IF LET 
        }//: SCROLLVIEW
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

#Preview {
    RestaurantDetailsView(restaurant: .init(id: 0, name: "Japan's Finest Tapas", imageName: "tapas"))
}
