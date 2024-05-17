//
//  RestaurantPhotosView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 14/5/24.
//

import SwiftUI
import Kingfisher

struct RestaurantPhotosView: View {
    //MARK: - PROPERTIES
    
    @State var mode = "grid"
    @State var shouldShowFullscreenModal = false
    @State var selectedPhotoIndex = 0
    
    @ObservedObject var vm: RestaurantDetailsViewModel

    init(vm: RestaurantDetailsViewModel){
        self.vm = vm
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
    }

    //MARK: - BODY
    var body: some View {
        GeometryReader{ proxy in
            ScrollView(showsIndicators: false){
                Picker("Test", selection: $mode){
                    Text("Grid").tag("grid")
                    Text("List").tag("list")
                }//: PICKER
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowFullscreenModal, content: {
                        ZStack(alignment: .topLeading){
                            Color.black.ignoresSafeArea()
                            RestaurantCarouselContainer(imageUrlStrings: vm.restaurant?.photos ?? [], selectedIndex: selectedPhotoIndex)
                            Button(action: {
                                shouldShowFullscreenModal.toggle()
                            },  label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color.white)
                                    .padding()
                            })
                        }//: ZSTACK
                    })//: SPACER
                    .opacity(shouldShowFullscreenModal ? 1 : 0)
                if mode == "grid"{
                    //GRID
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 600), spacing: 2),
                    ], spacing:4, content: {
                        ForEach(vm.restaurant?.photos ?? [], id: \.self){ item in
                            Button(action: {
                                self.selectedPhotoIndex = vm.restaurant?.photos.firstIndex(of: item) ?? 0

                                shouldShowFullscreenModal.toggle()
                            }, label: {
                                KFImage(URL(string: item))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3)
                                    .clipped()
                            })
                        }//: LOOP
                    })//: LAZY VERTICAL VIEW
                    .padding(.horizontal, 2)
                }else{
                    ForEach(vm.restaurant?.photos ?? [], id: \.self){ item in
                        VStack(alignment: .leading, spacing: 8) {
                            KFImage(URL(string: item))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }//: HSTACK
                                .padding(.horizontal, 8)
                                .font(.system(size: 22))
                            Text("\(vm.restaurant?.description ?? "")")
                                .font(.system(size: 14))
                                .padding(.horizontal, 8)
                            Text("Posted on \(randomDateString)")
                                .font(.system(size: 14))
                                .padding(.horizontal, 8)
                                .foregroundColor(.gray)
                        }//: VSTACK
                        .padding(.bottom)
                    }//: LOOP
                }//: IF AND ELSE
            }//: SCROLL
        }//: GEOMETRY READER
        .navigationBarTitle("All Photos", displayMode: .inline)
    }
    
    func randomDate(start: Date, end: Date) -> Date {
        let timeInterval = start.timeIntervalSince1970
        let timeIntervalForEndDate = end.timeIntervalSince1970
        let randomTimeInterval = TimeInterval.random(in: timeInterval...timeIntervalForEndDate)
        return Date(timeIntervalSince1970: randomTimeInterval)
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }

    var randomDateString: String {
        let startDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let endDate = Date()
        let date = randomDate(start: startDate, end: endDate)
        return formatDate(date)
    }
}

#Preview {
    NavigationView {
        RestaurantPhotosView(vm: .init(id: 1))
    }
}

