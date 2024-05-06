//
//  CategoryDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import SwiftUI

struct CategoryDetailView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm  = CategoryDetailViewModel()
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }//: VSTACK
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
            }else{
                ScrollView{
                    ForEach(vm.places, id: \.self){num in
                        VStack(alignment: .leading, spacing: 0){
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("test")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }//: VSTACK
                        .asTitle()
                        .padding()
                    }//: LOOP
                }//: SCROLLVIEW
            }
        }//: ZSTACK
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

//MARK: - PREVIEW
#Preview {
    CategoryDetailView()
}
