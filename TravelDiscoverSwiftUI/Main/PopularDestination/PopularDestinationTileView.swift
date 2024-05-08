//
//  PopularDestinationTileView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 7/5/24.
//

import SwiftUI

struct PopularDestinationTileView: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            Text(destination.name)
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            Text(destination.country)
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(Color.gray)
        }//: VSTACK
    }
}

struct PopularDestinationTileView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDestination = Destination(name: "Sample Destination", country: "Sample Country", imageName: "sample_image")
        PopularDestinationTileView(destination: sampleDestination)
    }
}

