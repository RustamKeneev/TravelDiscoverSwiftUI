//
//  PopularDishesView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 13/5/24.
//

import SwiftUI

struct PopularDishesView: View {
    //MARK: - PROPERTIES
    let dishes: [Dish]
    
    var body: some View {
        HStack {
            Text("Popular Dishes")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }//: HSTACK
        .padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(dishes, id: \.self) { dish in
                    VStack(alignment: .leading) {
                        DishCell(dish: dish)
                    }
                }
            }//:HSTACK
            .padding(.horizontal)
        }//: SCROLLVIEW
    }
}

#Preview {
    PopularDishesView(dishes: .init())
}
