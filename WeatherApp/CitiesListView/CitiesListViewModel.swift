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
    
    let persistence = Persistence()
        
    let repo = Repository()
        
    init() {}
    
}
