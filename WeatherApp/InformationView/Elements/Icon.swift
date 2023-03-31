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
    case rain
    case sun
    
    var image: Image {
        switch self {
        case .cloud:
            return AppAssets.cloud.swiftUIImage
        case .cloudSun:
            return AppAssets.cloudSun.swiftUIImage
        case .cloudThunderbold:
            return AppAssets.cloudThunderbold.swiftUIImage
        case .rain:
            return AppAssets.rain.swiftUIImage
        case .sun:
            return AppAssets.sun.swiftUIImage
        }
    }
    
}
