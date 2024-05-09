//
//  CategoryDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 5/5/24.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI


struct CategoryDetailView: View {
    //MARK: - PROPERTIES
    private let name: String
    
    @ObservedObject private var vm: CategoryDetailViewModel
    
    init(name: String) {
        self.name = name
        self.vm = .init(name: name)
    }
    
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
                    if !vm.errorMessage.isEmpty{
                        VStack(spacing: 12){
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(Color.red)
                            Text(vm.errorMessage)
                        }//: VSTACK
                    }
                    ScrollView{
                        ForEach(vm.places, id: \.self){place in
                            VStack(alignment: .leading, spacing: 0){
                                if vm.isLoading {
                                    Indicator()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)
                                }
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
        .navigationBarTitle(name, displayMode: .inline)
    }
}

//MARK: - PREVIEW
#Preview {
    CategoryDetailView(name: "Food")
}
