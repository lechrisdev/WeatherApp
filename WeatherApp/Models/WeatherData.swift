//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Le Chris on 12.04.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherData = try? JSONDecoder().decode(WeatherData.self, from: jsonData)

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentWeather: CurrentWeather
    let hourlyUnits: HourlyUnits
    let hourly: Hourly
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentWeather = "current_weather"
        case hourlyUnits = "hourly_units"
        case hourly
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature, windspeed: Double
    let winddirection, weathercode, isDay: Int
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperature, windspeed, winddirection, weathercode
        case isDay = "is_day"
        case time
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let weathercode: [Int]
    let temperature2MMax, temperature2MMin: [Double]
    let precipitationProbabilityMax: [Int]

    enum CodingKeys: String, CodingKey {
        case time, weathercode
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationProbabilityMax = "precipitation_probability_max"
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, weathercode, temperature2MMax, temperature2MMin: String
    let precipitationProbabilityMax: String

    enum CodingKeys: String, CodingKey {
        case time, weathercode
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationProbabilityMax = "precipitation_probability_max"
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]
    let temperature2M, precipitation: [Double]
    let weathercode: [Int]
    let uvIndex: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitation, weathercode
        case uvIndex = "uv_index"
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, temperature2M, precipitation, weathercode: String
    let uvIndex: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitation, weathercode
        case uvIndex = "uv_index"
    }
}
