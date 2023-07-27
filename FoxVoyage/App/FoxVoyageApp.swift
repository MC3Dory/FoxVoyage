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
    
    func saveToCoreDataForFirstTime(){
        if savePlacesToCoreData{
            do{
                let placemodels = try JSONManager.sharedInstance.loadData(path: "data", type: PlaceModel.self)
                for place in placemodels {
                    CoreDataController.sharedInstance.savePlaceModel(place)
                }
                savePlacesToCoreData = false
            }catch{
                print(error.localizedDescription)
            }
            return
        }
    }
    
    var body: some Scene {
        WindowGroup {
           OnboardingView()
                .onAppear{
                    saveToCoreDataForFirstTime()
                    
                }
            
        }
    }
}
