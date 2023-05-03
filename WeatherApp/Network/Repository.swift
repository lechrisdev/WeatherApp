//
//  Repository.swift
//  WeatherApp
//
//  Created by Le Chris on 19.04.2023.
//

import Foundation
import MapKit
import Swinject

protocol RepositoryProtocol {
    func searchCity(name: String) async -> [CityModel]
    func getWeather(lon: Double, lat: Double) async -> WeatherModel?
}

class Repository: RepositoryProtocol {
    
    let persistence = Container.shared.resolve(Persistence.self)!
    
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

class RepositoryMock: RepositoryProtocol {
    func searchCity(name: String) async -> [CityModel] {
        [
            CityModel(city: "Los Angeles", state: "California", country: "USA", longtitude: 0, latitude: 0)
        ]
    }
    
    func getWeather(lon: Double, lat: Double) async -> WeatherModel? {
        WeatherModel(icon: .drizzleFreezing,
                     isLocal: true,
                     temperature: 35,
                     currentTime: Date(),
                     uvIndex: 5,
                     rainProbability: 15,
                     airQuality: 5,
                     hourlyWeather: [HourWeather(temperature: 30,
                                                 icon: .drizzleFreezing,
                                                 time: "10.00 am")],
                     dailyWeather: [DayWeather(dayOfWeek: "monday",
                                               icon: .drizzle,
                                               probability: 10,
                                               dayTemp: 30,
                                               nightTemp: 20)],
                     latitude: 0,
                     longtitude: 0)
    }
}
