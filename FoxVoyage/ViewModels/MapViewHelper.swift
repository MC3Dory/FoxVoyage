//
//  MapViewHelper.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 26/07/23.
//

import SwiftUI
import MapKit

// MARK: UIKit MapView
struct MapViewHelper: UIViewRepresentable{
    @EnvironmentObject var locationManager: LocationManager
    
    func makeUIView(context: Context) -> MKMapView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let batamLocation = CLLocationCoordinate2D(latitude: 1.045626, longitude: 104.030454)
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        
        let region = MKCoordinateRegion(center: batamLocation, span: span)
        
        uiView.setRegion(region, animated: true)
    }
}
