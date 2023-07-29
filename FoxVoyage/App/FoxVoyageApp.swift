//
//  FoxVoyageApp.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI

@main
struct FoxVoyageApp: App {
    @AppStorage("savePlacesToCoreData") var savePlacesToCoreData: Bool = true
//    @State private var dataController = DataContoller()
    @StateObject var locationManager = LocationManager()
    @StateObject var informationViewModel = InformationViewModel()
    
    func saveToCoreDataForFirstTime(){
        if savePlacesToCoreData{
            do{
                let placemodels = try JSONManager.sharedInstance.loadData(path: "place", type: PlaceModel.self)
                
                for place in placemodels {
                    CoreDataController.sharedInstance.savePlaceModel(place)
                }
                savePlacesToCoreData = false
                print(placemodels)
            }catch{
                print(error.localizedDescription)
            }
            return
        }
    }
    
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(locationManager)
                .environmentObject(informationViewModel)
                .onAppear{
                    saveToCoreDataForFirstTime()
                    
                }
            
        }
    }
}
