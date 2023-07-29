//
//  JourneyView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 25/07/23.
//

import SwiftUI
import MapKit
import CoreLocationUI
import CoreLocation


struct TabItem: Identifiable {
    let id = UUID()
    let systemImageName: String
    var isActive: Bool
}


struct JourneyView: View {
    @StateObject var locationManager: LocationManager = .init()
    @EnvironmentObject var localSearchService: LocalSearchService
    @State var places: [PlaceModel] = []
    @State private var activeTabIndex = 0
    
    
    
    private let tabItems: [TabItem] = [
        TabItem(systemImageName: "map.fill", isActive: true),
        TabItem(systemImageName: "bookmark", isActive: false),
        TabItem(systemImageName: "rectangle.dashed.and.paperclip", isActive: false),
        TabItem(systemImageName: "person", isActive: false)
    ]
    
    var body: some View {
//        let _ = print([places])
        VStack{
            Map(
              coordinateRegion: $locationManager.region,
              showsUserLocation: true,
              annotationItems: places
            )
            { place in
              MapAnnotation(
                coordinate: CLLocationCoordinate2D(latitude: Double(place.longitude) ?? 0.0, longitude: Double(place.latitude) ?? 0.0)
              ) {
//                  LocationMapAnnotationView()
                VStack {
                  Text(place.name)
                    .font(.caption2)
                    .bold()
                  Image(systemName: "star.fill")
                    .font(.title2)
                    .foregroundColor(.red)
                    .shadow(radius: 1)
                }
              }
            }
            .ignoresSafeArea()
            
            Spacer()
            
            
            //tabview
            ZStack {
                Rectangle()
                    .frame(width: 359, height: 72)
                    .cornerRadius(999)
                    .foregroundColor(.white)
                
                HStack (spacing: 40) {
                    ForEach(tabItems) { item in
                        Button(action: {
                            activeTabIndex = tabItems.firstIndex(where: { $0.id == item.id }) ?? 0
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 56, height: 56)
                                    .foregroundColor(item.isActive ? Color("Redish400") : .white)
                                
                                Image(systemName: item.systemImageName)
                                    .font(.system(size: 18))
                                    .foregroundColor(item.isActive ? .white : Color("Black400"))
                            }
                        }
                    }
                }
            }
            
            
            
            
        
        LocationButton(.currentLocation) {
            locationManager.manager.requestLocation()
            print("location requested")
        }
        }
        .onAppear{
//            locationManager.fetchPlacesData()
            locationManager.manager.requestLocation()
            fetchPlaces()
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Map")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
    }
    
    func fetchPlaces(){
        //taruh isloading
        places = CoreDataController.sharedInstance.fetchPlaceModels()
        //
    }
    
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView().environmentObject(LocalSearchService())
    }
}
