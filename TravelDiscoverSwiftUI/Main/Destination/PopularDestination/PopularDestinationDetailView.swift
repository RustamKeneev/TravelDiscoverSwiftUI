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
        .init(name: "Eiffel Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
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
            
            DestinationHeaderContainer()
//                .frame(height: 40)
//            
//            Image(destination.imageName)
//                .resizable()
//                .scaledToFill()
                .frame(height: 250)
//                .clipped()
            
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
                    .font(.system(size: 14))
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
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)){
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

//MARK: - PREVIEW
#Preview {
    NavigationView {
        PopularDestinationDetailView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
}