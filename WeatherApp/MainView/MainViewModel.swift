//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var models: [WeatherModel] = []
    
    init() {
        
        Task {                  // ЗАГРУЗКА ПОГОДЫ ДЛЯ MAIN VIEW
            let data = await API.sendRequestData(request: Requests.getWeather(latitude: "46.5", longitude: "30.7"))
            
            if let result = data?.convertTo(WeatherData.self)?.domain {
                DispatchQueue.main.async {
                    self.models.append(result)
                }
            }
            
//            if let data, let result = try? JSONDecoder().decode(WeatherData.self, from: data) {
//                let weather = result.domain
//                print(weather)
//                DispatchQueue.main.async {
//                    self.models.append(weather)
//                }
//
//            }
        }
    }
}
