
import Foundation
import CoreData

class CoreDataController {
    
    private init(){}
    static let sharedInstance = CoreDataController()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaceModel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        })
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Add methods to save and load data from Core Data
    func savePlaceModel(_ placeModel: PlaceModel) {
        let entity = NSEntityDescription.entity(forEntityName: "Place", in: managedObjectContext)!
        let placeEntity = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        
        placeEntity.setValue(placeModel.id, forKey: "id")
        placeEntity.setValue(placeModel.longitude, forKey: "longitude")
        placeEntity.setValue(placeModel.latitude, forKey: "latitude")
        placeEntity.setValue(placeModel.name, forKey: "name")
        placeEntity.setValue(placeModel.tag, forKey: "tag")
        placeEntity.setValue(placeModel.address, forKey: "address")
        placeEntity.setValue(placeModel.district, forKey: "district")
        placeEntity.setValue(placeModel.operationalHour, forKey: "operationalHour")
        placeEntity.setValue(placeModel.desc, forKey: "desc")
        
        for activityModel in placeModel.activities {
            let activityEntity = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: managedObjectContext)
            activityEntity.setValue(activityModel.title, forKey: "title")
            activityEntity.setValue(activityModel.desc, forKey: "desc")
            
            placeEntity.mutableSetValue(forKey: "activities").add(activityEntity)
        }
        
        do {
            try managedObjectContext.save()
            print("success")
        } catch {
            fatalError("Failed to save data: \(error)")
        }
    }
    
    func fetchPlaceModels() -> [PlaceModel] {
        let fetchRequest = NSFetchRequest<Place>(entityName: "Place")
        
        do {
            let placeEntities = try managedObjectContext.fetch(fetchRequest)
            return placeEntities.map { placeEntity in
                let activities = (placeEntity.activities?.allObjects as? [Activity] ?? []).map { activityEntity in
                    ActivityModel(title: activityEntity.title ?? "", desc: activityEntity.desc ?? "")
                }
                return PlaceModel(
                    id: placeEntity.id ?? UUID(),
                    longitude: placeEntity.longitude ?? "",
                    latitude: placeEntity.latitude ?? "",
                    name: placeEntity.name ?? "",
                    tag: placeEntity.tag ?? "",
                    address: placeEntity.address ?? "",
                    district: placeEntity.district ?? "",
                    operationalHour: placeEntity.operationalHour ?? "",
                    desc: placeEntity.desc ?? "",
                    activities: activities
                )
            }
        } catch {
            fatalError("Failed to fetch data: \(error)")
        }
    }
}