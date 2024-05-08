//
//  PopularDestinationDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 8/5/24.
//

import SwiftUI

struct PopularDestinationDetailView: View {
    let destination: Destination
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
//                    .lineLimit(100)
//                    .frame(height: 1000)
                
                HStack{ Spacer() }
            }
            .padding(.horizontal)
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

#Preview {
//    PopularDestinationDetailView()
    NavigationView {
        PopularDestinationDetailView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower"))
    }
}
