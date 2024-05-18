//
//  UserDetailsView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 18/5/24.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {
    //MARK: - PROPERTIES
    let user: User
    
    @ObservedObject var vm: UserDetailsVIewModel
    
    init(user: User){
        self.user = user
        self.vm = .init(userID: user.id)
    }
    
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
                Text("\(self.vm.userDetails?.firstName ?? "") \(self.vm.userDetails?.lastName ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                HStack {
                    Text("@\(self.vm.userDetails?.username ?? "") •")
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
                        Text("\(vm.userDetails?.followers ?? 0)")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }//: VSTACK
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("\(vm.userDetails?.following ?? 0)")
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
                ForEach(vm.userDetails?.posts ?? [], id: \.self) { item in
                    VStack(alignment: .leading, spacing: 12) {
                        KFImage(URL(string: item.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        HStack {
                            Image(user.profileImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("\(item.views) views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                            }//: VSTACK
                        }//: HSTACK
                        .padding(.horizontal, 12)
                        HStack {
                            ForEach(item.hashtags, id: \.self) { item in
                                Text("#\(item)")
                                    .foregroundColor(Color(#colorLiteral(red: 0.07797152549, green: 0.513774395, blue: 0.9998757243, alpha: 1)))
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(#colorLiteral(red: 0.9057956338, green: 0.9333867431, blue: 0.9763537049, alpha: 1)))
                                    .cornerRadius(20)
                            }//: LOOP
                        }//: HSTACK
                        .padding(.bottom)
                        .padding(.horizontal, 12)
                    }//: VSTACK
                    .background(Color(white: 1))
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
    UserDetailsView(user: .init(id: 0, username: "Jhon", firstName: "1", lastName: "", profileImage: "amy", followers: 11, following: 1, posts: []))
}
