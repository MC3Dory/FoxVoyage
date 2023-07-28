////
////  SearchView.swift
////  FoxVoyage
////
////  Created by Fuad Fadlila Surenggana on 25/07/23.
////
//
//import SwiftUI
//import MapKit
//
//struct SearchView: View {
//    @State var searchText = ""
//    @StateObject var locationManager: LocationManager = .init()
//    // MARK: Navigation Tag to Push View to MapView
//    @State var navigationTag: String?
//    @State var presentNavigationView: Bool = false
//    
//    var body: some View {
//        VStack{
//            VStack{
//                Text("Hi [user’s name],")
//                    .foregroundColor(Color("Black200"))
//                    .font(.custom("SFProDisplay-Regular", size: 34))
//                    .frame(maxWidth: 355, alignment: .leading)
//                Text("where do you live?")
//                    .font(.custom("SFProDisplay-Regular", size: 34))
//                    .frame(maxWidth: 355, alignment: .leading)
//                
//            }
//            
//            Button {
//                // MARK: Navigating To MapView
//                if #available(iOS 16, *){
//                    presentNavigationView.toggle()
//                }else{
//                    navigationTag = "MAPVIEW"
//                }
//            } label: {
//                
//                HStack(spacing: 15){
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                        .padding()
//                    if let place = locationManager.pickedPlaceMark{
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text(place.name ?? "")
//                                .font(.title3.bold())
//                                .foregroundColor(.primary)
//                            
//                            Text(place.locality ?? "")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                    } else {
//                        Text("find locations here")
//                            .foregroundColor(.gray)
//                            .font(.custom("SFProDisplay-Regular", size: 17))
//                            .padding(.trailing, 12.0)
//                            .frame(maxWidth: 250, alignment: .leading)
//                    }
//                }
//                .frame(width: 358, height: 56, alignment: .leading)
//                .padding(5)
//                .background{
//                    RoundedRectangle(cornerRadius: 99, style: .continuous)
//                        .strokeBorder(.gray)
//                    
//                }
//                
//            }
//            
////            Button {
////                // MARK: Setting Map Region
////                if let coordinate = locationManager.userLocation?.coordinate{
////                    locationManager.mapView.removeAnnotations(locationManager.mapView.annotations)
////                    locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
////                    locationManager.addDraggablePin(coordinate: coordinate)
////                    locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
////                    
////                    // MARK: Navigating To MapView
////                    if #available(iOS 16, *){
////                        presentNavigationView.toggle()
////                    }else{
////                        navigationTag = "MAPVIEW"
////                    }
////                }
////            } label: {
////                Label {
////                    Text("Use Current Location")
////                        .font(.callout)
////                } icon: {
////                    Image(systemName: "location.north.circle.fill")
////                }
////                .foregroundColor(.green)
////            }
////            .frame(width: 358, height: 56, alignment: .leading)
//            //                .frame(maxWidth: .infinity, alignment: .leading)
//        
//            
//            
////            HStack{
////                Image(systemName: "magnifyingglass")
////                    .foregroundColor(.gray)
////                    .padding()
////
////                TextField("find locations here", text: $locationManager.searchText)
////                    .font(.custom("SFProDisplay-Regular", size: 17))
////                    .padding(.trailing, 12.0)
////                    .frame(maxWidth: 250, alignment: .leading)
////            }
////            .frame(width: 358, height: 56, alignment: .leading)
////            .padding(5)
////            .background{
////                RoundedRectangle(cornerRadius: 99, style: .continuous)
////                    .strokeBorder(.gray)
////            }
//            //                .border(Color.gray, width: 1)
//            //                .cornerRadius(999)
//            
////            if let places = locationManager.fetchedPlaces,!places.isEmpty{
////                List{
////                    ForEach(places,id: \.self){place in
////                        Button {
////                            if let coordinate = place.location?.coordinate{
////                                locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
////                                locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
////                                locationManager.addDraggablePin(coordinate: coordinate)
////                                locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
////                            }
////
////                            // MARK: Navigating To MapView
////                            if #available(iOS 16, *){
////                                presentNavigationView.toggle()
////                            }else{
////                                navigationTag = "MAPVIEW"
////                            }
////                        } label: {
////                            HStack(spacing: 15){
////                                Image(systemName: "mappin.circle.fill")
////                                    .font(.title2)
////                                    .foregroundColor(.gray)
////
////                                VStack(alignment: .leading, spacing: 6) {
////                                    Text(place.name ?? "")
////                                        .font(.title3.bold())
////                                        .foregroundColor(.primary)
////
////                                    Text(place.locality ?? "")
////                                        .font(.caption)
////                                        .foregroundColor(.gray)
////                                }
////                            }
////                        }
////
////                    }
////                }
////                .listStyle(.plain)
////            }
////            else{
////                // MARK: Live Location Button
////                Button {
////                    // MARK: Setting Map Region
////                    if let coordinate = locationManager.userLocation?.coordinate{
////                        locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
////                        locationManager.addDraggablePin(coordinate: coordinate)
////                        locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
////
////                        // MARK: Navigating To MapView
////                        if #available(iOS 16, *){
////                            presentNavigationView.toggle()
////                        }else{
////                            navigationTag = "MAPVIEW"
////                        }
////                    }
////                } label: {
////                    Label {
////                        Text("Use Current Location")
////                            .font(.callout)
////                    } icon: {
////                        Image(systemName: "location.north.circle.fill")
////                    }
////                    .foregroundColor(.green)
////                }
////                .frame(width: 358, height: 56, alignment: .leading)
////                //                .frame(maxWidth: .infinity, alignment: .leading)
////            }
//            
//            Spacer()
//            
//            Button{
//                
//            }
//        label: {
//            HStack{
//                Text("Selanjurnya")
//                    .font(.custom("SFProText-Regular", size: 17))
//                    .foregroundColor(.white)
//                Image(systemName: "arrow.up.forward")
//                    .foregroundColor(.white)
//            }
//            .frame(maxWidth: 358, maxHeight: 64)
//            .background(Color("Redish400"))
//            .cornerRadius(50)
//            
//        }
//        }
//        .background{
//            if #available(iOS 16, *){
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .navigationDestination(isPresented: $presentNavigationView, destination: {
//                        MapViewSelection()
//                            .environmentObject(locationManager)
//                            .toolbar(.hidden, for: .navigationBar)
//                    })
//            }else{
//                NavigationLink(tag: "MAPVIEW", selection: $navigationTag) {
//                    MapViewSelection()
//                        .environmentObject(locationManager)
//                        .navigationBarHidden(true)
//                } label: {}
//                    .labelsHidden()
//            }
//        }
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
