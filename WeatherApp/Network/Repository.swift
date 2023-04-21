//
//  Repository.swift
//  WeatherApp
//
//  Created by Le Chris on 19.04.2023.
//

import Foundation

class Repository {
    
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
        
                                        // ЗАГРУЗКА ПОГОДЫ ПО КООРДИНАТАМ
        let data = await API.sendRequestData(request: Requests.getWeather(latitude: String(lat), longitude: String(lon)))

        if let result = data?.convertTo(WeatherData.self) {
            weather = result.domain
        }
        return weather
    }
    
}
