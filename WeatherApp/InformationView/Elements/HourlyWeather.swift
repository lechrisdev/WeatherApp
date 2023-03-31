//
//  HourlyWeather.swift
//  WeatherApp
//
//  Created by Le Chris on 21.03.2023.
//

import SwiftUI

struct HourWeather: Hashable {
    var temperature: Int
    var icon: Icon
    var time: String
}

// ВЬЮ, КОТОРАЯ ПОКАЗЫВАЕТ ДОХУЛИАРД HourCell ОДНОВРЕМЕННО. КАКИМИ ДАННЫМИ ОНО ИХ ЗАПОЛНЯЕТ? ТЕМИ, КОТОРЫХ ДОХУЛИАРД!
struct HourlyWeather: View {
    
    let hours: [HourWeather] // ДАННЫЕ О ПОГОДЕ
    
    var body: some View {
 
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(hours), id: \.self) { hour in
                        
                            // СОЗДАЕМ ЯЧЕЙКУ С ДАННЫМИ О ПОГОДЕ
                        HourCell(temperature: hour.temperature,
                                 icon: hour.icon,
                                 time: hour.time)
                    }
                }
            }.padding(.horizontal, 16)
    }
}

// ЯЧЕЙКА, КОТОРАЯ УМЕЕТ ПОКАЗЫВАТЬ ДАННЫЕ О ПОГОДЕ НА 1 ЧАС
struct HourCell: View {
    
    var temperature: Int
    var icon: Icon
    var time: String
    
    init(temperature: Int, icon: Icon, time: String) {
        self.temperature = temperature
        self.icon = icon
        self.time = time
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            Text("\(temperature)°")
                .font(.system(size: 15))
            icon.image
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFill()
                .padding(.vertical, 6)
            Text(time)
                .font(.system(size: 10))
        }
        .frame(height: 155)
    }
}

struct HourlyWeather_Previews: PreviewProvider {
    static var previews: some View {
        
        // ДОХУЛИАРД ДАННЫХ О ПОГОДЕ
        let hours = [
            HourWeather(temperature: 24, icon: .cloud, time: "12:00"),
            HourWeather(temperature: 24, icon: .cloudSun, time: "13:00"),
            HourWeather(temperature: 25, icon: .sun, time: "14:00"),
            HourWeather(temperature: 26, icon: .sun, time: "15:00"),
            HourWeather(temperature: 28, icon: .sun, time: "16:00"),
            HourWeather(temperature: 26, icon: .cloudSun, time: "17:00"),
            HourWeather(temperature: 24, icon: .rain, time: "18:00")
        ]
        
        // ЧТО ХОЧЕТ ОТ НАС ЭТА ПОЕБЕНЬ? ДОХУЛИАРД ДАННЫХ О ПОГОДЕ ПОЧАСОВО!
        HourlyWeather(hours: hours)
    }
}
