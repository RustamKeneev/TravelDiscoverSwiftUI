//
//  MainView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 3/5/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                DiscoverCategoriesView()
            }//: SCROLL VIEW
            .navigationTitle("Discover")
        }//: NAVIGATION VIEW
    }
}

#Preview {
    MainView()
}
