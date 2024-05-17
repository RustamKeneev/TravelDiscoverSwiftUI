//
//  TrendingCreatorsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct TrendingCreatorsView: View {
    //MARK: - PROPERTIES
    
    let users: [User] = [
        User(id: 1, username: "amyadams20", firstName: "Amy", lastName: "Adams", profileImage: "amy", followers: 0, following: 0, posts: []),
        User(id: 2, username: "billybilly", firstName: "Billy", lastName: "Childs", profileImage: "billy", followers: 0, following: 0, posts: []),
        User(id: 3, username: "samsmith", firstName: "Sam", lastName: "Smith", profileImage: "sam", followers: 0, following: 0, posts: [])
    ]
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack{
                Text("Trending creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }//: HSTACK
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 12){
//                    ForEach(users, id: \.self){ user in
//                        VStack{
//                            Image(user.profileImage)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 60, height: 60)
//                                .background(Color(.init(white: 0.9, alpha: 1)))
//                                .cornerRadius(.infinity)
//                            Text(user.username)
//                                .font(.system(size: 10, weight: .semibold))
//                                .multilineTextAlignment(.center)
//                        }//: VSTACK
//                        .frame(width: 60)
//                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
//                        .padding(.bottom)
//                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
            }//: SCROLLVIEW
        }//: VSTACK
    }
}

//MARK: - PREVIEW
struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}


//MARK: - PREVIEW
#Preview {
    TrendingCreatorsView()
}
