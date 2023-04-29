//
//  Persistence.swift
//  WeatherApp
//
//  Created by Le Chris on 24.04.2023.
//

import Foundation
import CoreData
import MapKit

class Persistence {
    
    private let model = "DataModel"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        return createContainer()
        
    }()
    
    private lazy var context: NSManagedObjectContext = {
        return createContext()
    }()
    
    public init() {}
    
    func loadWeatherCoordinates() -> [CLLocationCoordinate2D] {
        
        let result = try? context.fetch(WeatherCoordinate.fetchRequest())
            .map { CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lon)
            }
        return result ?? []
    }
    
    func saveNewCoordinate(for coordinate2D: CLLocationCoordinate2D) {

        let newItem = WeatherCoordinate(context: context)
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump  // Чтобы перезаписывалось, а не дублировалось.
        newItem.id = Int64(loadWeatherCoordinates().count)
        newItem.lon = coordinate2D.longitude
        newItem.lat = coordinate2D.latitude

        do {
            try context.save()
        } catch {
            print("⛔️⛔️⛔️⛔️⛔️", error)
        }

    }
    
    func saveWeather(for coordinate2D: CLLocationCoordinate2D, data: Data) {

        let newItem = CDWeatherData(context: context)
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump  // Чтобы перезаписывалось, а не дублировалось.
        newItem.longitude = coordinate2D.longitude
        newItem.latitude = coordinate2D.latitude
        newItem.data = data
        newItem.date = Date()

        do {
            try context.save()
        } catch {
            print("⛔️⛔️⛔️⛔️⛔️", error)
        }

    }
    
    func loadWeather(by coordinates: CLLocationCoordinate2D) -> Data? {
            
        let request: NSFetchRequest<CDWeatherData> = CDWeatherData.fetchRequest()
        let predicate1 = NSPredicate(format: "latitude == %@", NSNumber(value: coordinates.latitude))
        let predicate2 = NSPredicate(format: "longitude == %@", NSNumber(value: coordinates.longitude))
        request.predicate = NSCompoundPredicate(type: .and, subpredicates: [predicate1, predicate2])

        do {
            guard let response = try context.fetch(request).first else { return nil }
            let now = Date()
            let calendar = Calendar.current
            if let weatherDate = response.date {
                let savedDate30Min = calendar.date(byAdding: .minute, value: 30, to: weatherDate)!
                if now > savedDate30Min {
                    return nil
                } else {
                    return response.data
                }
            }
            return nil
        } catch {
            print("Error fetching data from context \(error)")
        }
        return nil
    }
    
//    func loadSavedCities() -> [CDWeatherData] {
//        //
//    }
    
    func saveContext () {
        
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func createContainer() -> NSPersistentContainer {

        let container = NSPersistentContainer(name: model)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        let description = NSPersistentStoreDescription()
        description.shouldInferMappingModelAutomatically = true
        description.shouldMigrateStoreAutomatically = true
        container.persistentStoreDescriptions = [description]
        
        return container
    }
    
    private func createContext() -> NSManagedObjectContext {
        let context = persistentContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        return context
    }
        
}
