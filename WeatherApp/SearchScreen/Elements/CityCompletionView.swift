//
//  CityCompletionView.swift
//  WeatherApp
//
//  Created by Le Chris on 28.03.2023.
//

import SwiftUI

struct CityCompletionView: View {
    
    var cities: [CityModel]
    
    let router: Router
    
    var body: some View {

        VStack(alignment: .leading, spacing: 5) {
            ForEach(Array(cities), id: \.self) { city in
                
                                // (2) СОЗДАЕМ ЯЧЕЙКУ С ДАННЫМИ О ПОГОДЕ
                CityCell(model: city, router: router)
            }
        }
    }
}

struct CityCell: View {     // (1) ЯЧЕЙКА = ПРЯМОУГОЛЬНИК И НАЗВАНИЕ ГОРОДА
    
    var model: CityModel
    let router: Router
    
    init(model: CityModel, router: Router) {
        self.model = model
        self.router = router
    }
    
    var body: some View {
        
        Button(
            action: {
                print("\(model.longtitude), \(model.latitude)")
                router.showWeatherView(lon: model.longtitude, lat: model.latitude)
        }, label: {
            
//            Text("\(model.city) (", "\(model.state), ", "\(model.country))")
//            Text("\(model.city)\(model.state != nil ? " (\(model.state), " + " (")\(model.country))")
            HStack(spacing: 0) {
                if model.city != "" {
                    Text("\(model.city) (")
                }
                if model.state != "" {
                    Text("\(model.state), ")
                }
                if model.country != "" {
                    Text("\(model.country))")
                }
            }
            .foregroundColor(.black)
            .font(.system(size: 10))
            .padding(.vertical, 8)
            .padding(.horizontal, 18)
            .roundedBackground(7)
            .padding(.trailing, 10)
            .frame(height: 31)
//            Text("\(model.city) (\(model.state), \(model.country)")
//                .foregroundColor(.black)
//                .font(.system(size: 10))
//                .padding(.vertical, 8)
//                .padding(.horizontal, 18)
//                .roundedBackground(7)
//                .padding(.trailing, 10)
//                .frame(height: 31)
        })
        .frame(height: 44)
        .roundedBackground(15)
        
    }
}

struct CityCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        
        let cities = [
            CityModel(city: "Odesa", state: "Odesa Oblast`", country: "Ukraine", longtitude: 30.0, latitude: 45.5),
            CityModel(city: "Kharkiv", state: "Kharkivs`ka Oblast`", country: "Ukraine", longtitude: 30.0, latitude: 45.5),
            CityModel(city: "Odesa", state: "Odesa Oblast`", country: "Ukraine", longtitude: 30.0, latitude: 45.5)
        ]
        CityCompletionView(cities: cities, router: Router())
    }
}
