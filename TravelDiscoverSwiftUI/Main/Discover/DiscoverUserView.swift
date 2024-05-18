//
//  DiscoverUserView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 18/5/24.
//

import SwiftUI

struct DiscoverUserView: View {
    //MARK: - PROPERTIES
    let user: User
    
    //MARK: - BODY
    var body: some View {
        VStack{
            Image(user.profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .background(Color(.init(white: 0.9, alpha: 1)))
                .cornerRadius(.infinity)
            Text(user.username)
                .font(.system(size: 10, weight: .semibold))
                .multilineTextAlignment(.center)
        }//: VSTACK
        .frame(width: 60)
        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
        .padding(.bottom)
    }//: END BODY
}//: END DISCOVER USER VIEW

//MARK: - PREVIEW
#Preview {
    DiscoverUserView(user: .init(id: 0, username: "", firstName: "", lastName: "", profileImage: "", followers: 12, following: 23, posts: []))
}
