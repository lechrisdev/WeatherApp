//
//  CityData.swift
//  WeatherApp
//
//  Created by Le Chris on 13.04.2023.
//

import Foundation

// MARK: - WeatherData
struct CityData: Codable {
    let type: String
    let features: [Feature]
    let query: Query
}

// MARK: - Feature
struct Feature: Codable {
    let type: String
    let properties: Properties
    let geometry: Geometry
    let bbox: [Double]
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Properties
struct Properties: Codable {
    let datasource: Datasource
    let name: String?
    let country, countryCode, state, city: String
    let municipality, district: String?
    let lon, lat: Double
    let county: String?
    let formatted, addressLine1, addressLine2, category: String
    let timezone: Timezone
    let resultType: String
    let rank: Rank
    let placeID: String
    let postcode, stateCode, region, stateCOG: String?
    let departmentCOG: String?

    enum CodingKeys: String, CodingKey {
        case datasource, name, country
        case countryCode = "country_code"
        case state, city, municipality, district, lon, lat, county, formatted
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case category, timezone
        case resultType = "result_type"
        case rank
        case placeID = "place_id"
        case postcode
        case stateCode = "state_code"
        case region
        case stateCOG = "state_COG"
        case departmentCOG = "department_COG"
    }
}

// MARK: - Datasource
struct Datasource: Codable {
    let sourcename, attribution, license: String
    let url: String
}

// MARK: - Rank
struct Rank: Codable {
    let importance: Double
    let confidence, confidenceCityLevel: Int
    let matchType: String

    enum CodingKeys: String, CodingKey {
        case importance, confidence
        case confidenceCityLevel = "confidence_city_level"
        case matchType = "match_type"
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    let name: String
    let nameAlt: String?
    let offsetSTD: String
    let offsetSTDSeconds: Int
    let offsetDST: String
    let offsetDSTSeconds: Int
    let abbreviationSTD, abbreviationDST: String

    enum CodingKeys: String, CodingKey {
        case name
        case nameAlt = "name_alt"
        case offsetSTD = "offset_STD"
        case offsetSTDSeconds = "offset_STD_seconds"
        case offsetDST = "offset_DST"
        case offsetDSTSeconds = "offset_DST_seconds"
        case abbreviationSTD = "abbreviation_STD"
        case abbreviationDST = "abbreviation_DST"
    }
}

// MARK: - Query
struct Query: Codable {
    let text: String
    let parsed: Parsed
}

// MARK: - Parsed
struct Parsed: Codable {
    let city, expectedType: String

    enum CodingKeys: String, CodingKey {
        case city
        case expectedType = "expected_type"
    }
}
extension CityData {
    
    var domain: [CityModel] {
        
        let unit = features.map { feature in
            
            let city = feature.properties.city
            let state = feature.properties.state
            let country = feature.properties.country
            let longtitude = feature.properties.lon
            let latitude = feature.properties.lat
            
            return CityModel(city: city,
                             state: state,
                             country: country,
                             longtitude: longtitude,
                             latitude: latitude)
        }
        return unit
    }
    
}
