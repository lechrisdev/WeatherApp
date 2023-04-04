//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    let hours = [
        HourWeather(temperature: 24, icon: .cloud, time: "12:00"),
        HourWeather(temperature: 24, icon: .cloudSun, time: "13:00"),
        HourWeather(temperature: 25, icon: .sun, time: "14:00"),
        HourWeather(temperature: 26, icon: .sun, time: "15:00"),
        HourWeather(temperature: 28, icon: .sun, time: "16:00"),
        HourWeather(temperature: 26, icon: .cloudSun, time: "17:00"),
        HourWeather(temperature: 24, icon: .rain, time: "18:00")
    ]
    
    let days = [
        DayWeather(dayOfWeek: "Wednesday", icon: .cloudSun, probability: 50, dayTemp: 30, nightTemp: 25),
        DayWeather(dayOfWeek: "Thursday", icon: .cloudThunderbold, probability: 50, dayTemp: 31, nightTemp: 26),
        DayWeather(dayOfWeek: "Friday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 27),
        DayWeather(dayOfWeek: "Saturday", icon: .cloudSun, probability: 50, dayTemp: 32, nightTemp: 28),
        DayWeather(dayOfWeek: "Sunday", icon: .sun, probability: 50, dayTemp: 33, nightTemp: 28),
        DayWeather(dayOfWeek: "Monday", icon: .cloud, probability: 50, dayTemp: 31, nightTemp: 27),
        DayWeather(dayOfWeek: "Tuesday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 25)
    ]
    
    var models: [WeatherModel] = []
    
    init() {
        self.models.append(
            WeatherModel(cityName: "Odesa",
                         icon: .sun,
                         isLocal: true,
                         temperature: 25,
                         currentTime: Date(),
                         uvIndex: 4,
                         rainProbability: 10,
                         airQuality: 80,
                         hourlyWeather: hours,
                         dailyWeather: days,
                         latitude: 46.5, longtitude: 30.7)
                      )
        
        self.models.append(
            WeatherModel(cityName: "Kharkiv",
                         icon: .cloudSun,
                         isLocal: true,
                         temperature: 25,
                         currentTime: Date(),
                         uvIndex: 4,
                         rainProbability: 10,
                         airQuality: 80,
                         hourlyWeather: hours,
                         dailyWeather: days,
                         latitude: 46.5, longtitude: 30.7)
                      )
        
        self.models.append(
            WeatherModel(cityName: "Lviv",
                         icon: .cloud,
                         isLocal: true,
                         temperature: 25,
                         currentTime: Date(),
                         uvIndex: 4,
                         rainProbability: 10,
                         airQuality: 80,
                         hourlyWeather: hours,
                         dailyWeather: days,
                         latitude: 46.5, longtitude: 30.7)
                      )
    }
}
