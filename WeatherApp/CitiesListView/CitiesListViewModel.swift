//
//  CitiesListViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation
import MapKit

class CitiesListViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    let persistence: PersistenceProtocol
        
    let repo: RepositoryProtocol
        
    init(persistence: PersistenceProtocol, repo: RepositoryProtocol) {
        self.repo = repo
        self.persistence = persistence
    }
    
}
