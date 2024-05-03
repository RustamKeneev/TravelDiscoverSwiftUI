//
//  PopularDestinationView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct PopularDestinationView: View {
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
                HStack(spacing: 8){
                    ForEach(0..<5, id: \.self){ num in
                        Spacer()
                            .frame(width: 124, height: 128)
                            .background(Color.gray)
                            .cornerRadius(6)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            .padding(.bottom)
                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
            }//: SCROLLVIEW
        }//: VSTACK
    }
}

#Preview {
    PopularDestinationView()
}
