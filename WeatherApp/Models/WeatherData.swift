//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Le Chris on 12.04.2023.
//

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

// MARK: - перевод WeatherData в WeatherModel
extension WeatherData {
    var domain: WeatherModel {
        print(">>>>>>> TIMEZONE", timezone, timezoneAbbreviation)
        let hourlyWeather = hourly.time.enumerated().map { index, time in
                let temperature = hourly.temperature2M[index]
                let weatherCode = hourly.weathercode[index]
            let formattedTime = Date(string: time).toString(style: .amPm)
                return HourWeather(temperature: Int(temperature),
                                   icon: Icon(weatherId: weatherCode),
                                   time: formattedTime)
        }
        
        let dailyWeather = daily.time.enumerated().map { index, time in
                let day = Date(stringDay: time)
            print(">>>>", time)
                let weekday = day.dayOfTheWeek() ?? ""
                let icon = Icon(weatherId: daily.weathercode[index])
                let probability = daily.precipitationProbabilityMax[index]
                let dayTemp = daily.temperature2MMax[index]
                let nightTemp = daily.temperature2MMin[index]
                return DayWeather(dayOfWeek: weekday,
                                  icon: icon,
                                  probability: probability,
                                  dayTemp: Int(dayTemp),
                                  nightTemp: Int(nightTemp))
        }
        
        let components = timezoneAbbreviation.components(separatedBy: " ")
        let timeZone = components.last
        
        return WeatherModel(icon: Icon(weatherId: currentWeather.weathercode),
                            isLocal: false,
                            temperature: Int(currentWeather.temperature),
                            currentTime: Date(string: currentWeather.time),
                            uvIndex: Int(hourly.uvIndex[0]),
                            rainProbability: Int(hourly.precipitation[0]),
                            airQuality: 0,
                            hourlyWeather: hourlyWeather,
                            dailyWeather: dailyWeather,
                            latitude: latitude,
                            longtitude: longitude,
                            timezone: timeZone ?? "")
    }
}
