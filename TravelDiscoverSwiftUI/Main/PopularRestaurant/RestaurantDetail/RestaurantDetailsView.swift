//
//  RestaurantDetailsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 11/5/24.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    // MARK: - PROPERTIES
    @ObservedObject var vm: RestaurantDetailsViewModel
    @State private var isAnimating = false

    let restaurant: Restaurant
    @State private var randomStarCount: Float = Float.random(in: 1...5)

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        self.vm = .init(id: restaurant.id)
    }

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            StarsView(rating: CGFloat(randomStarCount), maxRating: 5)
                            let number = randomStarCount
                            let formattedNumber = String(format: "%.2f", number)
                            Text("Rating: \(String(format: "%.2f", randomStarCount))")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 18, weight: .bold))
                        }//: HSTACK
                    }//: VSTACK
                    Spacer()
                    NavigationLink {RestaurantPhotosView(vm: vm)
                    } label: {
                        Text("See more \(vm.restaurant?.photos.count ?? 0) photos")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 80)
                            .multilineTextAlignment(.trailing)
                            .scaleEffect(isAnimating ? 1.2 : 1.0)
                            .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
                            .onAppear {
                                self.isAnimating = true
                            }
                    }//: NAVLINK
                }//: HSTACK
                .padding()
            }//: ZSTACK
            LocationDescriptionView(vm: vm)
            if let dishes = vm.restaurant?.popularDishes {
                PopularDishesView(dishes: dishes)
            }//: IF LET
            if let reviews = vm.restaurant?.reviews {
                CustomerReviewsVIew(reviews: reviews)
            }//: IF LET
        }//: SCROLLVIEW
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
        .onAppear {
            randomStarCount = Float.random(in: 1...5)
            print(randomStarCount)
        }//: ON APPEAR
    }//: END BODY
}

#Preview {
    RestaurantDetailsView(restaurant: .init(id: 0, name: "Japan's Finest Tapas", imageName: "tapas"))
}

