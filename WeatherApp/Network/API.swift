//
//  API.swift
//  WeatherApp
//
//  Created by Le Chris on 12.04.2023.
//

import Foundation
import Alamofire

class API {

    // MARK: OLD
    func sendRequest(request: EndPoint, result: @escaping (Data) -> ()) {
        AF.request(request.path,
                   method: request.httpMethod,
                   parameters: request.parameters)
            .validate(statusCode: 200..<300)
            .responseData { response in
                if let data = response.data {
                    result(data)
                }
            }
    }
    
    // MARK: NEW
   static func sendRequestData(request: EndPoint) async -> Data? {
        do {
            return try await AF.request(request.path,
                                        method: request.httpMethod,
                                        parameters: request.parameters,
                                        encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .serializingData()
            .value
        } catch {
            print("Error sending request: \(error)")
            return nil
        }
    }
}

protocol EndPoint {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
}

enum Requests: EndPoint {
    case getWeather(latitude: String, longitude: String)
    case autoComplete(city: String)

    var path: String {
        switch self {
        case .getWeather:
            return "https://api.open-meteo.com/v1/forecast"
        case .autoComplete:
            return "https://api.geoapify.com/v1/geocode/autocomplete"
        }
    }

    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getWeather:
            return .get
        case .autoComplete:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case let .getWeather(latitude, longitude):
            let parameters: [String: Encodable] = [
                "latitude":        latitude,
                "longitude":       longitude,
                "hourly":          "temperature_2m,precipitation,weathercode,uv_index",
                "daily":           "weathercode,temperature_2m_max,temperature_2m_min,precipitation_probability_max",
                "current_weather": "true",
                "timezone":        "auto"
            ]
            return parameters
        case let .autoComplete(city):
            let parameters: [String: Encodable] = [
                "text": city,
                "apiKey": "19f20be35e704379a74b18c66a6e5c4d"
            ]
            return parameters
        }
    }
}
