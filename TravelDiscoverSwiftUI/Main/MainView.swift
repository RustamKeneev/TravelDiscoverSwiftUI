//
//  MainView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct MainView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    @Environment(\.colorScheme) var colorScheme

    //MARK: - BODY
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                Color.discoverBackground
                    .offset(y: 400)
                ScrollView{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }//: HSTACK
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(.init(white:1 , alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    DiscoverCategoriesView()
                    VStack{
                        PopularDestinationView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }//: VSTACK
                    .background(Color.defaultsBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }//: SCROLL VIEW
            }//:ZSTACK
            .navigationTitle("Discover")
        }//: NAVIGATION VIEW
    }//: END BODY
}//: END MAIN VIEW

//MARK: - PREVIEW
#Preview {
    MainView()
}
