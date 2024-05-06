//
//  CategoryDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import SwiftUI
import Kingfisher
import SDWebImage
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
                ZStack{
                    Text(vm.errorMessage)
                    ScrollView{
                        ForEach(vm.places, id: \.self){place in
                            VStack(alignment: .leading, spacing: 0){
//                                Image("art1")
                                KFImage(URL(string: place.thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }//: VSTACK
                            .asTitle()
                            .padding()
                        }//: LOOP
                    }//: SCROLLVIEW
                }//: ZSTACK
            }
        }//: ZSTACK
        .navigationBarTitle("Category", displayMode: .inline)
    }
}

//MARK: - PREVIEW
#Preview {
    CategoryDetailView()
}
