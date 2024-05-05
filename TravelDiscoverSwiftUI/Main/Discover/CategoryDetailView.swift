//
//  CategoryDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import SwiftUI

struct CategoryDetailView: View {
    var body: some View {
        ScrollView{
            ForEach(0..<5, id: \.self){num in
                VStack(alignment: .leading, spacing: 0){
                    Image("art1")
                        .resizable()
                        .scaledToFill()
                    Text("test")
                        .font(.system(size: 12, weight: .semibold))
                        .padding()
                }//: VSTACK
                .asTitle()
                .padding()
            }//: LOOP
        }//: SCROLLVIEW
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

#Preview {
    CategoryDetailView()
}
