//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Le Chris on 02.04.2023.
//

import Foundation

struct WeatherModel: Hashable {
    
        // CurrentTemperatureView
    let cityName: String
    let icon: Icon
    let isLocal: Bool
    let temperature: Int
        // DetailsView
    let currentTime: Date
    let uvIndex: Int
    let rainProbability: Int
    let airQuality: Int
        // HourlyWeather
    let hourlyWeather: [HourWeather]
        // WeekForecast
    let dailyWeather: [DayWeather]
        // MapView
    let latitude: Float
    let longtitude: Float
    
}
