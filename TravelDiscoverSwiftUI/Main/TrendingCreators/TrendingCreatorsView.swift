//
//  TrendingCreatorsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct TrendingCreatorsView: View {
    //MARK: - PROPERTIES
    
    let users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy", imageName: "billy"),
        .init(name: "Sam Smith", imageName: "sam"),
    ]
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack{
                Text("Trending places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }//: HSTACK
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 12){
                    ForEach(users, id: \.self){ user in
//                        Spacer()
                        VStack{
                            Image(user.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .background(Color(.init(white: 0.9, alpha: 1)))
                                .cornerRadius(.infinity)
                            Text(user.name)
                                .font(.system(size: 10, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }//: VSTACK
                            .frame(width: 60)
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
    TrendingCreatorsView()
}
