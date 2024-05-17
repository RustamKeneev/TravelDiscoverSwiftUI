//
//  LocationDescriptionView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 13/5/24.
//

import SwiftUI

struct LocationDescriptionView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm: RestaurantDetailsViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8){
            Text("Location & Description")
                .font(.system(size: 18, weight: .bold))
            HStack {
                Text("City:")
                Text("\(vm.restaurant?.name ?? "")")
                    .font(.system(size: 16, weight: .semibold))
            }//: HSTACK
            HStack{
                Text("Country:")
                Text("\(vm.restaurant?.country ?? "")")
                    .font(.system(size: 16, weight: .semibold))
            }//:HSTACK

            HStack {
                Text("Categories:")
                Text("\(vm.restaurant?.category ?? "")")
                    .font(.system(size: 16, weight: .semibold))
            }//: HSTACK
            HStack {
                ForEach(0..<5,id: \.self){ num in
                    Image(systemName: "dollarsign.circle.fill")
                }//: LOOP
                .foregroundColor(.orange)
            }//: HSTACK
            Text(vm.restaurant?.description ?? "")
                .padding(.top, 8)
                .font(.system(size: 14, weight: .regular))
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }//: VSTACK
        .padding()
    }
}

#Preview {
    LocationDescriptionView(vm: .init(id: 0))
}
