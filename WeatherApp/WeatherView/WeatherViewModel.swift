//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation
import MapKit

class WeatherViewModel: ObservableObject {
    
    @Published var model: WeatherModel?
    
    let repo = Repository()
    
    let persistence = Persistence()
    
    @MainActor func getWeather(lon: Double, lat: Double) {
        Task {
            self.model = await repo.getWeather(lon: lon, lat: lat)
        }
    }
    
    func saveToCoreData(lat: Double, lon: Double) {
        persistence.saveNewCoordinate(for: CLLocationCoordinate2D(latitude: lat,
                                                                  longitude: lon) )
    }
    
}
