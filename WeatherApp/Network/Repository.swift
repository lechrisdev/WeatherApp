//
//  Repository.swift
//  WeatherApp
//
//  Created by Le Chris on 19.04.2023.
//

import Foundation
import MapKit

class Repository {
    
    let persistence = Persistence()
    
    func searchCity(name: String) async -> [CityModel] {
        
        var cities: [CityModel] = []
        
                                        // ЗАГРУЗКА ГОРОДА ДЛЯ SEARCH SCREEN VIEW
        let data = await API.sendRequestData(request: Requests.autoComplete(city: name))

        if let result = data?.convertTo(CityData.self) {
            cities = result.domain
        }
        return cities
    }
    
    func getWeather(lon: Double, lat: Double) async -> WeatherModel? {
        
        var weather: WeatherModel?
                                    // ПРОВЕРКА, ЕСТЬ ЛИ В CORE DATA ПО КООРДИНАТАМ
        if let savedData = persistence.loadWeather(by: CLLocationCoordinate2D(latitude: lat,
                                                                              longitude: lon)) {
            if let result = savedData.convertTo(WeatherData.self) {
                weather = result.domain
                print("Погода из Core Data")
            }
            return weather
        } else {
                                    // ЗАГРУЗКА ПОГОДЫ ПО КООРДИНАТАМ
            let data = await API.sendRequestData(request: Requests.getWeather(latitude: String(lat), longitude: String(lon)))
            
            if let result = data?.convertTo(WeatherData.self) {
                persistence.saveWeather(for: CLLocationCoordinate2D(latitude: lat, longitude: lon), data: data!)
                weather = result.domain
                print("Погода из интернета")
            }
            return weather
        }
    }
    
}
