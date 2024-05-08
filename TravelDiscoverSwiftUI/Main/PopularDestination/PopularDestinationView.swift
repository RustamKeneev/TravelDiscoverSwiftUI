//
//  PopularDestinationView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct PopularDestinationView: View {
    //MARK: - PROPERTIES
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york"),
    ]

    //MARK: - BODY
    var body: some View {
        VStack {
            HStack{
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }//: HSTACK
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8.0){
                    ForEach(destinations, id: \.self){ destination in
                        NavigationLink {
                            PopularDestinationDetailView(destination: destination)
                        } label: {
                            PopularDestinationTileView(destination: destination)
                            .asTitle()
                                .padding(.bottom)
                        }
                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
            }//: SCROLLVIEW
        }//: VSTACK
    }
}

//MARK: - PREVIEW
#Preview {
    PopularDestinationView()
}
