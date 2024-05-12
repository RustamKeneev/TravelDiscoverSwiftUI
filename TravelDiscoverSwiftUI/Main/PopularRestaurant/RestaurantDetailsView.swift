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
    @ObservedObject var vm = RestaurantDetailsViewModel()

    let restaurant: Restaurant
    
    let sampleDishPhotos = [
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe"
    ]

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
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }//: HSTACK
                .padding()
            }//: ZSTACK
            VStack (alignment: .leading, spacing: 8){
                Text("Location & Description")
                    .font(.system(size: 16, weight: .bold))
                Text("Tokyo, Japan")
                HStack {
                    ForEach(0..<5,id: \.self){ num in
                        Image(systemName: "dollarsign.circle.fill")
                    }//: LOOP
                    .foregroundColor(.orange)
                }//: HSTACK
                Text(vm.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }//: VSTACK
            .padding()
            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) { dish in
                        VStack(alignment: .leading) {
                            DishCell(dish: dish)
                        }
                    }
                }//:HSTACK
                .padding(.horizontal)
            }//: SCROLLVIEW
        }//: SCROLLVIEW
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

#Preview {
    RestaurantDetailsView(restaurant: .init(name: "Japan", imageName: "tapas"))
}
