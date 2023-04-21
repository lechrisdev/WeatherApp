//
//  DataExtensions.swift
//  WeatherApp
//
//  Created by Le Chris on 18.04.2023.
//

import Foundation

// MARK: - перевод любой Data в любую dataModel (generic)
extension Data {
    
    func convertTo<SomeData: Decodable>(_ dataModel: SomeData.Type) -> SomeData? {
        do {
            let result = try JSONDecoder().decode(dataModel, from: self)
            return result
        } catch let error {
            print(error)
            return nil
        }
    }
}
