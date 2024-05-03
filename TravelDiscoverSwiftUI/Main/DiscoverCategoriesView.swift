//
//  DiscoverCategoriesView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 16){
                ForEach(0..<6, id: \.self){ num in
                    VStack(spacing: 4) {
                        Spacer()
                            .frame(width: 52, height: 52)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text("Art")
                            .font(.system(size: 12, weight: .semibold))
                    }//: VSTACK
                }//: LOOP
            }//: HSTACK
            .padding(.horizontal)
        }//: SCROLL VIEW
    }
}

#Preview {
    DiscoverCategoriesView()
}
