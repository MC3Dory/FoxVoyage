//
//  MapViewSelection.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 25/07/23.
//

import SwiftUI
import MapKit

// MARK: MapView Live Selection
struct MapViewSelection: View{
    @EnvironmentObject var locationManager: LocationManager
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    @State var navigationTag: String?
    @State var presentNavigationView: Bool = false
    
    var body: some View{
        ZStack{
            MapViewHelper()
                .environmentObject(locationManager)
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 10) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(alignment: .topLeading)
                    
                    VStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("find locations here", text: $locationManager.searchText)
                                .font(.custom("SFProDisplay-Regular", size: 17))
                                .padding(.trailing, 12.0)
                                .frame(maxWidth: 250, alignment: .leading)
                        }
                        //                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                        //                .frame(alignment: .topLeading)
                        .padding(5)
                        .background{
                            RoundedRectangle(cornerRadius: 99, style: .continuous)
                                .strokeBorder(.gray)
                                .background(.ultraThinMaterial)
                        }
                        if let places = locationManager.fetchedPlaces,!places.isEmpty{
                            List{
                                ForEach(places,id: \.self){place in
                                    Button {
                                        if let coordinate = place.location?.coordinate{
                                            locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                            locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                                            locationManager.addDraggablePin(coordinate: coordinate)
                                            locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                                        }
                                        
                                        // MARK: Navigating To MapView
                                        if #available(iOS 16, *){
                                            presentNavigationView.toggle()
                                        }else{
                                            navigationTag = "MAPVIEW"
                                        }
                                    } label: {
                                        HStack(spacing: 15){
                                            Image(systemName: "mappin.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                Text(place.name ?? "")
                                                    .font(.title3.bold())
                                                    .foregroundColor(.primary)
                                                
                                                Text(place.locality ?? "")
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            .listStyle(.plain)
                            .frame(maxHeight: 200)
                            .background(.ultraThinMaterial)
                        }
                        else{
                            // MARK: Live Location Button
                            Button {
                                // MARK: Setting Map Region
                                if let coordinate = locationManager.userLocation?.coordinate{
                                    locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                                    locationManager.addDraggablePin(coordinate: coordinate)
                                    locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                                    
                                    // MARK: Navigating To MapView
                                    if #available(iOS 16, *){
                                        presentNavigationView.toggle()
                                    }else{
                                        navigationTag = "MAPVIEW"
                                    }
                                }
                            } label: {
                                Label {
                                    Text("Use Current Location")
                                        .font(.callout)
                                } icon: {
                                    Image(systemName: "location.north.circle.fill")
                                }
                                .foregroundColor(.green)
                            }
                            //                            .frame(alignment: .topLeading)
                            //                            .frame(width: 358, height: 56, alignment: .leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                Spacer()
            }
            // MARK: COMMENT THIS WHEN BUILD (for editing in canvas only)
            // MARK: Then replace the code below
            //            VStack(spacing: 15){
            //                Text("Confirm Location")
            //                    .font(.title2.bold())
            //
            //                HStack(spacing: 15){
            //                    Image(systemName: "mappin.circle.fill")
            //                        .font(.title2)
            //                        .foregroundColor(.gray)
            //
            //                    VStack(alignment: .leading, spacing: 6) {
            //                        Text("place.name ?? ")
            //                            .font(.title3.bold())
            //
            //                        Text("place.locality ?? ")
            //                            .font(.caption)
            //                            .foregroundColor(.gray)
            //                    }
            //                }
            //                .frame(maxWidth: .infinity,alignment: .leading)
            //                .padding(.vertical,10)
            //
            //                Button {
            //                } label: {
            //                    Text("Confirm Location")
            //                        .fontWeight(.semibold)
            //                        .frame(maxWidth: .infinity)
            //                        .padding(.vertical,12)
            //                        .background{
            //                            RoundedRectangle(cornerRadius: 10, style: .continuous)
            //                                .fill(.green)
            //                        }
            //                        .overlay(alignment: .trailing) {
            //                            Image(systemName: "arrow.right")
            //                                .font(.title3.bold())
            //                                .padding(.trailing)
            //                        }
            //                        .foregroundColor(.white)
            //                }
            //            }
            //            .padding()
            //            .background{
            //                RoundedRectangle(cornerRadius: 10, style: .continuous)
            //                    .fill(scheme == .dark ? .black : .white)
            //                    .ignoresSafeArea()
            //            }
            //            .frame(maxHeight: .infinity,alignment: .bottom)
            // MARK: END OF COMMENT
            
            // MARK: Displaying Data
            if let place = locationManager.pickedPlaceMark{
                VStack(spacing: 15){
                    //                    Text("Confirm Location")
                    //                        .font(.title2.bold())
                    HStack(spacing: 15){
                        Image(systemName: "mappin.circle.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(place.name ?? "")
                                .font(.title3.bold())
                            
                            Text(place.locality ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical,10)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Confirm Location")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,12)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.green)
                            }
                            .overlay(alignment: .trailing) {
                                Image(systemName: "arrow.right")
                                    .font(.title3.bold())
                                    .padding(.trailing)
                            }
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(scheme == .dark ? .black : .white)
                        .ignoresSafeArea()
                }
                .frame(maxHeight: .infinity,alignment: .bottom)
            }
        }
        //        .onDisappear {
        //            locationManager.pickedLocation = nil
        //            locationManager.pickedPlaceMark = nil
        //
        //            locationManager.mapView.removeAnnotations(locationManager.mapView.annotations)
        //        }
    }
}

struct MapViewSelection_Previews: PreviewProvider {
    static var previews: some View {
        MapViewSelection()
            .environmentObject(LocationManager())
    }
}

