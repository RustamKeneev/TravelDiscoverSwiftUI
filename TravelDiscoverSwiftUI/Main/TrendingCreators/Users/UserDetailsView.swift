//
//  UserDetailsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 18/5/24.
//

import SwiftUI

struct UserDetailsView: View {
    //MARK: - PROPERTIES
    let user: User
    
    //MARK: - BODY
    var body: some View {
        ScrollView{
            VStack(spacing: 12){
                    Image(user.profileImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding(.horizontal)
                        .padding(.top)
                Text("Amy Adams")
                    .font(.system(size: 14, weight: .semibold))
                HStack {
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }//: HSTACK
                    .font(.system(size: 12, weight: .regular))
                Text("YouTuber, Blogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                HStack(spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }//: VSTACK
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("2,112")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }//: VSTACK
                }//: HSTACK
                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(.white)
                            Spacer()
                        }//: HSTACK
                            .padding(.vertical, 8)
                            .background(Color.orange)
                        .cornerRadius(100)
                    })//: BUTTON
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })//: BUTTON
                }//: HSTACK
                    .font(.system(size: 11, weight: .semibold))
                ForEach(0..<10, id: \.self) { num in
                    HStack {
                        Spacer()
                    }//: HSTACK
                        .frame(height: 200)
                        .background(Color(white: 0.8))
                        .cornerRadius(12)
                        .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }//: LOOP
            }//: VSTACK
            .padding(.horizontal)
        }//: SCROLLVIEW
        .navigationBarTitle(user.firstName, displayMode: .inline)
    }//: END BODY
}//: END USER DETAILS VIEW

//MARK: - PREVIEW
#Preview {
    UserDetailsView(user: .init(id: 1, username: "Jhon", firstName: "1", lastName: "", profileImage: "amy", followers: 11, following: 1, posts: []))
}
