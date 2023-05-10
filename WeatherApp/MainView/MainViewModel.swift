//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import Foundation
import CoreLocation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    let persistence: PersistenceProtocol
    
    var arrayOfCoordinates: [CLLocationCoordinate2D] = []
    
    let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol, persistence : PersistenceProtocol) {
        self.repo = repo
        self.persistence = persistence
    }
    
    func updateWeather() {
        models = []
        arrayOfCoordinates = []
        arrayOfCoordinates = persistence.loadWeatherCoordinates()
        loadArrayOfCities()
    }
    
    func loadLocalWeather(coordinates2D: CLLocationCoordinate2D) {
        if models.allSatisfy({ $0.isLocal == false }) {
            Task {
                if var weather = await repo.getWeather(lon: coordinates2D.longitude,
                                                       lat: coordinates2D.latitude) {
                    weather.isLocal = true
                    let weatherLocal = weather
                    DispatchQueue.main.async {
                        var modelsWithCurrent: [WeatherModel] = []
                        modelsWithCurrent.append(weatherLocal)
                        modelsWithCurrent.append(contentsOf: self.models)
                        self.models = modelsWithCurrent
                    }
                }
            }
        }
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
