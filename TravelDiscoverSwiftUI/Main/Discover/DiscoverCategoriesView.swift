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
                    NavigationLink {
                        CategoryDetailView(name: category.name)
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 28))
                                .foregroundColor(Color.orange)
                                .frame(width: 68, height: 68)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                        }//: VSTACK
                    }//: NAVIGATION LINK

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
