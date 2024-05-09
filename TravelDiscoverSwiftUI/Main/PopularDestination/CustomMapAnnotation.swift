//
//  CustomMapAnnotation.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 9/5/24.
//

import SwiftUI

struct CustomMapAnnotation: View {
    let attraction: Attraction
    var body: some View {
        VStack{
            Image(attraction.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(.infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(attraction.name)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(
                    LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .leading, endPoint: .trailing)
                )
                .foregroundColor(.white)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
        }//: VSTACK
        .shadow(radius: 6)
    }
}

#Preview {
    CustomMapAnnotation(attraction: .init(name: "Paris", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
}
