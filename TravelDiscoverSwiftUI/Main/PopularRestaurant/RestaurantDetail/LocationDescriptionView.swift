//
//  LocationDescriptionView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 13/5/24.
//

import SwiftUI

struct LocationDescriptionView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm = RestaurantDetailsViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8){
            Text("Location & Description")
                .font(.system(size: 18, weight: .bold))
            Text("Tokyo, Japan")
            HStack {
                ForEach(0..<5,id: \.self){ num in
                    Image(systemName: "dollarsign.circle.fill")
                }//: LOOP
                .foregroundColor(.orange)
            }//: HSTACK
            Text(vm.details?.description ?? "")
                .padding(.top, 8)
                .font(.system(size: 14, weight: .regular))
        }//: VSTACK
        .padding()
    }
}

#Preview {
    LocationDescriptionView()
}
