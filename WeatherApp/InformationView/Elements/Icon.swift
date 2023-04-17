//
//  Icon.swift
//  WeatherApp
//
//  Created by Le Chris on 21.03.2023.
//

import SwiftUI

enum Icon {
    case cloud
    case cloudSun
    case cloudThunderbold
    case drizzle
    case drizzleFreezing
    case fog
    case fogRime
    case rain
    case rainFreezing
    case rainShowers
    case snow
    case snowFall
    case snowGrains
    case sun
    case thunderstormHail
    
    init(weatherId: Int) {
        switch weatherId {
        case 0, 1: // чисто небо, преимущественно ясно // Clear sky, Mainly clear
            self = .sun
        case 2: // переменная облачность // Partly cloudy
            self = .cloudSun
        case 3: // пасмурная погода // Overcast
            self = .cloud
        case 45: // Туман // Fog
            self = .fog
        case 48: // Туман и изморозь // Depositing rime fog
            self = .fogRime
        case 51, 53, 55: // Морось: Легкая, умеренная и плотная интенсивность // Drizzle: Light, moderate, and dense intensity
            self = .drizzle
        case 56, 57: // Ледяная морось: Легкая и плотная интенсивность // Freezing Drizzle: Light and dense intensity
            self = .drizzleFreezing
        case 61, 63, 65: // Дождь: Слабый, умеренный и сильный // Rain: Slight, moderate and heavy intensity
            self = .rain
        case 66, 67: // Ледяной дождь: легкий и сильный // Freezing Rain: Light and heavy intensity
            self = .rainFreezing
        case 71, 73, 75: // Снегопад: легкий, умеренный и сильный // Snow fall: Slight, moderate, and heavy intensity
            self = .snowFall
        case 77: // Снежные зерна // Snow grains
            self = .snowGrains
        case 80, 81, 82: // Ливневые дожди: слабые, умеренные и сильные // Rain showers: Slight, moderate, and violent
            self = .rainShowers
        case 85, 86: // Снег слабый и сильный // Snow showers slight and heavy
            self = .snow
        case 95: // Гроза: Слабая или умеренная // Thunderstorm: Slight or moderate
            self = .cloudThunderbold
        case 96, 99: // Гроза со слабым и сильным градом // Thunderstorm with slight and heavy hail
            self = .thunderstormHail
        default:
            self = .sun
        }
    }
    
    var image: Image {
        switch self {
        case .cloud:
            return AppAssets.cloud.swiftUIImage
        case .cloudSun:
            return AppAssets.cloudSun.swiftUIImage
        case .cloudThunderbold:
            return AppAssets.cloudThunderbold.swiftUIImage
        case .drizzle:
            return AppAssets.drizzle.swiftUIImage
        case .drizzleFreezing:
            return AppAssets.drizzleFreezing.swiftUIImage
        case .fog:
            return AppAssets.fog.swiftUIImage
        case .fogRime:
            return AppAssets.fogRime.swiftUIImage
        case .rain:
            return AppAssets.rain.swiftUIImage
        case .rainFreezing:
            return AppAssets.rainFreezing.swiftUIImage
        case .rainShowers:
            return AppAssets.rainShowers.swiftUIImage
        case .snow:
            return AppAssets.snow.swiftUIImage
        case .snowFall:
            return AppAssets.snowFall.swiftUIImage
        case .snowGrains:
            return AppAssets.snowGrains.swiftUIImage
        case .sun:
            return AppAssets.sun.swiftUIImage
        case .thunderstormHail:
            return AppAssets.thunderstormHail.swiftUIImage
        }
    }
    
}
