//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import Foundation
import CoreLocation

class MainViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    var arrayOfCoordinates: [CLLocationCoordinate2D] = [
        
        CLLocationCoordinate2D(latitude: 46.48253, longitude: 30.72331), // Одесса
        CLLocationCoordinate2D(latitude: 49.9935, longitude: 36.23038), // Харьков
        CLLocationCoordinate2D(latitude: 49.83968, longitude: 24.02972) // Львов
        
    ]
    
    let repo = Repository()
    
    init() {
        loadArrayOfCities()
    }
    
    func loadWeather(coordinates2D: CLLocationCoordinate2D) async {
        
            if let weather = await repo.getWeather(lon: coordinates2D.longitude,
                                                   lat: coordinates2D.latitude) {
                DispatchQueue.main.async {
                    self.models.append(weather)
                    print(">>>>", self.models.first)
                
                }
            }
    }
    
    func loadArrayOfCities() {
        Task {
            for coordinates in arrayOfCoordinates {
                await loadWeather(coordinates2D: coordinates)
            }
        }
    }
//    In MainViewModel create a func for loading all saved cities from an array of coordinates
    
}
