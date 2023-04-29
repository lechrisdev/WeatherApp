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
    
    let persistence = Persistence()
    
    var arrayOfCoordinates: [CLLocationCoordinate2D] = []
    
    let repo = Repository()
    
    init() {}
    
    func updateWeather() {
        models = []
        arrayOfCoordinates = []
        arrayOfCoordinates = persistence.loadWeatherCoordinates()
        loadArrayOfCities()
    }
    
    private func loadArrayOfCities() {
        Task {
            for coordinates in arrayOfCoordinates {
                await loadWeather(coordinates2D: coordinates)
            }
        }
    }
    
    private func loadWeather(coordinates2D: CLLocationCoordinate2D) async {
        
            if let weather = await repo.getWeather(lon: coordinates2D.longitude,
                                                   lat: coordinates2D.latitude) {
                DispatchQueue.main.async {
                    self.models.append(weather)
                }
            }
    }    
}
