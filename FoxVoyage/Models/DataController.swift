//
//  DataController.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import Foundation
import CoreData

class DataContoller: ObservableObject{
    let container = NSPersistentContainer(name: "PlaceModel")
    
    init() {
        container.loadPersistentStores{ desc, error in
            if let error = error{
                print("failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    //save data
    func save (context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        }catch{
            print("We could not save the data")
        }
    }
    
    func addPhoto(photobyuser: String, context: NSManagedObjectContext){
        let place = Place(context: context)
        
        
    
        
        save(context: context)
    }
    
    func editPhoto(place: Place, photobyuser: String, context: NSManagedObjectContext){
        place.photobyuser = photobyuser
        
        
        save(context: context)
    }
}
