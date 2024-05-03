//
//  DiscoverCategoriesView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    //MARK: - PROPERTIES
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
    ]
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 16){
                ForEach(categories, id: \.self){ category in
                    VStack(spacing: 4) {
//                        Spacer()
                        Image(systemName: category.imageName)
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .frame(width: 68, height: 68)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }//: VSTACK
                }//: LOOP
            }//: HSTACK
            .padding(.horizontal)
        }//: SCROLL VIEW
    }
}

//MARK: - PREVIEW
#Preview {
    DiscoverCategoriesView()
}