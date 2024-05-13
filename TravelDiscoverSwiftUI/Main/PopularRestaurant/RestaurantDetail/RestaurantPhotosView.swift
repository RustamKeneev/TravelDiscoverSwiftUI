//
//  RestaurantPhotosView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 14/5/24.
//

import SwiftUI

struct RestaurantPhotosView: View {
    //MARK: - PROPERTIES

    //MARK: - BODY

    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: [
                GridItem(.fixed(126), spacing: 4),
                GridItem(.fixed(126), spacing: 4),
                GridItem(.fixed(126), spacing: 4),
            ], spacing:6, content: {
                ForEach(0..<15, id: \.self){ item in
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                        .padding()
                        .background(Color.red)
                }
            })//: LAZY VERTICAL VIEW
            Text("RestaurantPhotosView")
        }//: SCROLL
        .navigationBarTitle("All Photos", displayMode: .inline)
    }
}

#Preview {
    NavigationView{
        RestaurantPhotosView()
    }
}
