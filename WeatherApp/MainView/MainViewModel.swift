//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    let repo = Repository()
    
    init() {
        Task {
            if let weather = await repo.getWeather(lon: 30.68363780440557, lat: 46.48590215) {
                DispatchQueue.main.async {
                    self.models.append(weather)
                    print(">>>>", self.models.first)
                
                }
                
            }
        }
    }
}
