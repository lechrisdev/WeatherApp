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
    
    let repo: RepositoryProtocol
    
    let persistence: PersistenceProtocol
    
    init(repo: RepositoryProtocol, persistence: PersistenceProtocol) {
        self.repo = repo
        self.persistence = persistence
    }
    
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
