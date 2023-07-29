//
//  LocationManager.swift
//  CheckLocation
//
//  Created by Fuad Fadlila Surenggana on 18/07/23.
//

import SwiftUI
import CoreLocation
import MapKit
// MARK: Combine Framework to watch Textfield Change
import Combine

class AlertSettings: ObservableObject {
    @Published var showAlert = false
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
    // MARK: Properties
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    
    // MARK: Search Bar Text
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    @Published var fetchedPlaces: [CLPlacemark]?
    
    // MARK: User Location
    @Published var userLocation: CLLocation?
    
    // MARK: Final Location
    @Published var pickedLocation: CLLocation?
    @Published var pickedPlaceMark: CLPlacemark?
    
    @Published var region : MKCoordinateRegion = .init()
//    @Published var region = MKCoordinateRegion.defaultRegion()
    
    @State var places: [PlaceModel] = []
    
    @Published var placeToCheckIn: String = ""
    
    
    var locationCoordinatesArray: [CLLocationCoordinate2D]  = []
    var identifiersArray: [String] = []
    
    var settings = AlertSettings()
    
    override init(){
        super.init()
        // MARK: Setting Delegates
        manager.delegate = self
        mapView.delegate = self
        
        // MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestLocation()
        
        // MARK: Search Textfield Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                if value != ""{
                    self.fetchPlaces(value: value)
                }else{
                    self.fetchedPlaces = nil
                }
            })
    }
    
    func fetchPlaces(value: String){
        // MARK: Fetching places using MKLocalSearch & Asyc/Await
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                
                let response = try await MKLocalSearch(request: request).start()
                // We can also Use Mainactor To publish changes in Main Thread
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> CLPlacemark? in
                        return item.placemark
                    })
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // MARK: Location Authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
            case .authorizedAlways: manager.requestLocation()
            case .authorizedWhenInUse: manager.requestLocation()
            case .denied: handleLocationError()
            case .notDetermined: manager.requestWhenInUseAuthorization()
            default: ()
        }
    }
    
    func handleLocationError(){
        print("access denied")
    }
    
    // MARK: Add Draggable Pin to MapView
    func addDraggablePin(coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
//        annotation.title = "Food will be delivered here"
        
        mapView.addAnnotation(annotation)
    }
    
    // MARK: Enabling Dragging
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "DELIVERYPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else{return}
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
        updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.longitude))
    }
    
    func updatePlacemark(location: CLLocation){
        Task{
            do{
                guard let place = try await reverseLocationCoordinates(location: location) else{return}
                await MainActor.run(body: {
                    self.pickedPlaceMark = place
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    // MARK: Displaying New Location Data
    func reverseLocationCoordinates(location: CLLocation)async throws->CLPlacemark?{
        let place = try await CLGeocoder().reverseGeocodeLocation(location).first
        return place
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
//        print("[didUpdateLocations][Location]\(location.coordinate)")
        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.userLocation = location
        
//        fetchedDataLocation()
//        Task {
//            await readFileJSONdata()
//        }
        
    }
    
    func fetchedDataLocation() {
        locationCoordinatesArray = [
            //            CLLocationCoordinate2D(latitude: 1.185307, longitude: 104.102234),
            CLLocationCoordinate2D(latitude: 40.7579747, longitude: -73.9855426),
            CLLocationCoordinate2D(latitude: 1.126091, longitude: 104.098618),
        ]
        
        locationCoordinatesArray.append(CLLocationCoordinate2D(latitude: 1.185307, longitude: 104.102234))
        
        identifiersArray = ["Times Square", "Mall Botania 1"]
        identifiersArray.append("NDP")
        
//        ForEach(places) { place in
//            monitorRegionsAtLocations(locations: [CLLocationCoordinate2D(latitude: Double(place.longitude) ?? 0.0, longitude: Double(place.latitude) ?? 0.0]), identifiers: [place.name])
//
//        }
        
        //        print(locationData[1].name)
        //
        //        ForEach(locationData) { loc in
        //            locationCoordinatesArray.append(CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude))
        //        }
        monitorRegionsAtLocations(locations: locationCoordinatesArray, identifiers: identifiersArray)
    }
    
    
    func monitorRegionsAtLocations(locations: [CLLocationCoordinate2D], identifiers: [String]) {
        // Make sure the device supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            //            let maxDistance = manager.maximumRegionMonitoringDistance
            let maxDistance = 50
            // For the sake of this tutorial, we will use the maximum allowed distance.
            // When you are going production, it is recommended to optimize this value according to your needs to be less resource-intensive.
            
            for (index, coordinate) in locations.enumerated() {
                let identifier = identifiers[index]
                // Register the region.
                let region = CLCircularRegion(center: coordinate, radius: CLLocationDistance(maxDistance), identifier: identifier)
                region.notifyOnEntry = true
                region.notifyOnExit = true
                
                //                manager.startMonitoringVisits()
                manager.startMonitoring(for: region)
            }
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        settings.showAlert = true
        
        if UIApplication.shared.applicationState == .active {
            
        } else {
            manager.startMonitoringVisits()
            print("You arrived at \(region.identifier)")
            let body = "You arrived at " + region.identifier
            let notificationContent = UNMutableNotificationContent()
            notificationContent.body = body
            notificationContent.sound = .default
            notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(
                identifier: "location_change",
                content: notificationContent,
                trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error: \(error)")
                }
            }
            
            self.placeToCheckIn = region.identifier
        }
        
    }
    
    func fetchPlaces(){
        places = CoreDataController.sharedInstance.fetchPlaceModels()
    }
}

