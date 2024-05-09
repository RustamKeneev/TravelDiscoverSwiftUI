//
//  PopularDestinationDetailView.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 8/5/24.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {
    //MARK: - PROPERIES

    let destination: Destination
    
    let attractions: [Attraction] = [
        .init(name: "Eifel tower", latitude: 35.679693, longitude: 139.771913),
        .init(name: " tower", latitude: 35.99693, longitude: 140.991913)
    ]
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = false
    
    init(destination: Destination){
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
            
                HStack{ Spacer() }
            }
            .padding(.horizontal)
            HStack{
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Button(action: {
                    isShowingAttractions.toggle()
                }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") attractions")
                        .font(.system(size: 12, weight: .semibold))
                })
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
            }//: HSTACK
            .padding(.horizontal)
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ?  attractions : []){ attraction  in
                MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .red)
            }
            .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

//MARK: - PREVIEW
#Preview {
//    PopularDestinationDetailView()
    NavigationView {
        PopularDestinationDetailView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 35.679693, longitude: 139.771913))
    }
}
