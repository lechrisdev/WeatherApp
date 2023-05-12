//
//  CitiesListViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation
import MapKit
import SwiftUI

class CitiesListViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    let persistence: PersistenceProtocol
        
    let repo: RepositoryProtocol
        
    init(persistence: PersistenceProtocol, repo: RepositoryProtocol) {
        self.repo = repo
        self.persistence = persistence
    }
    
    func deleteCity(coordinate: CLLocationCoordinate2D) {
        if persistence.deleteWeather(for: coordinate) {
            guard let index = models.firstIndex(where: { $0.latitude == coordinate.latitude }) else { return }
            withAnimation {
                models.remove(at: index)
            }
        }
    }
    
    func updateCitiesOrder() {
        let updatedCoordinates = models.map({ CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longtitude) })
        for updatedCoordinate in updatedCoordinates {
            print(">>>> DELETE", updatedCoordinate)
            persistence.deleteWeather(for: updatedCoordinate)
        }
        for updatedCoordinate in updatedCoordinates {
            print(">>>> SAVE", updatedCoordinate)
            persistence.saveNewCoordinate(for: updatedCoordinate)
        }
    }
}
