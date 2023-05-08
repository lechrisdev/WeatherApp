//
//  WeekForecast.swift
//  WeatherApp
//
//  Created by Le Chris on 31.03.2023.
//

import SwiftUI

struct DayWeather: Hashable {
    var dayOfWeek: String
    var icon: Icon
    var probability: Int
    var dayTemp: Int
    var nightTemp: Int
}

struct WeekForecast: View {
    
    let days: [DayWeather]
    
    var body: some View {
        VStack {
            ForEach(Array(days), id: \.self) { day in
                
                    // СОЗДАЕМ ЯЧЕЙКУ С ДАННЫМИ О ПОГОДЕ
                DailyCell(dayOfWeek:   day.dayOfWeek,
                          icon:        day.icon,
                          probability: day.probability,
                          dayTemp:     day.dayTemp,
                          nightTemp:   day.nightTemp)
            }
        }
        .padding(.horizontal, 17)
        .roundedBackground().frame(height: 250)
    }
}

struct DailyCell: View {
    
    var dayOfWeek: String
    var icon: Icon
    var probability: Int
    var dayTemp: Int
    var nightTemp: Int
    
    init(dayOfWeek: String, icon: Icon, probability: Int, dayTemp: Int, nightTemp: Int) {
        self.dayOfWeek = dayOfWeek
        self.icon = icon
        self.probability = probability
        self.dayTemp = dayTemp
        self.nightTemp = nightTemp
    }
    
    var body: some View {
        
        HStack {
            Text(dayOfWeek)
                .font(.system(size: 15))
                .foregroundColor(AppAssets.darkGray.swiftUIColor)
                .frame(maxWidth: 140, alignment: .leading)
            
            Spacer()
            
            icon.image.resizable().scaledToFit().frame(width: 24)
            
            Spacer()
            
            Text("\(probability)%")
                .font(.system(size: 15))
                .foregroundColor(AppAssets.lightBlue.swiftUIColor)
                .frame(minWidth: 70, alignment: .leading)
                .opacity(probability >= 10 ? 1 : 0)
            
            Spacer()
            
            Text("\(dayTemp)°")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .foregroundColor(AppAssets.darkGray.swiftUIColor)
                .frame(minWidth: 40, alignment: .trailing)
            
            Spacer()
            
            Text("\(nightTemp)°")
                .font(.system(size: 15))
                .foregroundColor(AppAssets.darkGray.swiftUIColor)
                .frame(minWidth: 40, alignment: .trailing)
        }
    }
}

struct WeekForecast_Previews: PreviewProvider {
    static var previews: some View {
        
        let days = [
            DayWeather(dayOfWeek: "Wednesday", icon: .cloudSun, probability: 50, dayTemp: 30, nightTemp: 25),
            DayWeather(dayOfWeek: "Thursday", icon: .cloudThunderbold, probability: 100, dayTemp: 291, nightTemp: 26),
            DayWeather(dayOfWeek: "Friday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 100),
            DayWeather(dayOfWeek: "Saturday", icon: .cloudSun, probability: 50, dayTemp: 5, nightTemp: 1),
            DayWeather(dayOfWeek: "Sunday", icon: .sun, probability: 5, dayTemp: 33, nightTemp: 28),
            DayWeather(dayOfWeek: "Monday", icon: .cloud, probability: 100, dayTemp: 31, nightTemp: 27),
            DayWeather(dayOfWeek: "Tuesday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 25)
        ]
        
        WeekForecast(days: days)
            .padding(.horizontal, 24)
    }
}
