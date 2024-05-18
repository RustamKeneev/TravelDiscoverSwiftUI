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
        User(id: 0, username: "amyadams20", firstName: "Amy", lastName: "Adams", profileImage: "amy", followers: 0, following: 0, posts: []),
        User(id: 1, username: "billybilly", firstName: "Billy", lastName: "Childs", profileImage: "billy", followers: 0, following: 0, posts: []),
        User(id: 2, username: "samsmith", firstName: "Sam", lastName: "Smith", profileImage: "sam", followers: 0, following: 0, posts: [])
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
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(
                            destination: UserDetailsView(user: user),
                            label: {
                                DiscoverUserView(user: user)
                            })//: NAVIGATION LINK
                    }//: LOOP
                }//: HSTACK
                .padding(.horizontal)
                .padding(.bottom)
            }//: SCROLLVIEW
        }//: VSTACK
    }//: END BODY
}//: END TRENDING CREATORS VIEW

//MARK: - PREVIEW
#Preview {
    TrendingCreatorsView()
}
