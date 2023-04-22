//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var model: WeatherModel?
    
    let repo = Repository()
    
    func getWeather(lon: Double, lat: Double) {
        Task {
            self.model = await repo.getWeather(lon: lon, lat: lat)
        }
    }
    
}
