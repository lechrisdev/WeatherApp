//
//  CityCompletionView.swift
//  WeatherApp
//
//  Created by Le Chris on 28.03.2023.
//

import SwiftUI

struct CityCompletionView: View {
    
    var cities: [String]
    
    var body: some View {
//        Text("Mumbai")
//            .padding(.vertical, 8)
//            .padding(.horizontal, 18)
//            .roundedBackground(7)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(cities), id: \.self) { city in
                    
                                    // (2) СОЗДАЕМ ЯЧЕЙКУ С ДАННЫМИ О ПОГОДЕ
                    CityCell(cityName: city)
                }
            }
        }
    }
}

struct CityCell: View {     // (1) ЯЧЕЙКА = ПРЯМОУГОЛЬНИК И НАЗВАНИЕ ГОРОДА
    
    var cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 10))
            .padding(.vertical, 8)
            .padding(.horizontal, 18)
            .roundedBackground(7)
            .padding(.trailing, 10)
            .frame(height: 31)
    }
}

struct CityCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        
        let cities = ["Mumbai", "Toronro", "Los Angeles", "Paris"]
        CityCompletionView(cities: cities)
    }
}
