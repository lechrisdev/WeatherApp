//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import SwiftUI

struct WeatherView: View {
    
    let hours = [
        HourWeather(temperature: 24, icon: .cloud, time: "12:00"),
        HourWeather(temperature: 24, icon: .cloudSun, time: "13:00"),
        HourWeather(temperature: 25, icon: .sun, time: "14:00"),
        HourWeather(temperature: 26, icon: .sun, time: "15:00"),
        HourWeather(temperature: 28, icon: .sun, time: "16:00"),
        HourWeather(temperature: 26, icon: .cloudSun, time: "17:00"),
        HourWeather(temperature: 24, icon: .rain, time: "18:00")
    ]
    
    let days = [
        DayWeather(dayOfWeek: "Wednesday", icon: .cloudSun, probability: 50, dayTemp: 30, nightTemp: 25),
        DayWeather(dayOfWeek: "Thursday", icon: .cloudThunderbold, probability: 50, dayTemp: 31, nightTemp: 26),
        DayWeather(dayOfWeek: "Friday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 27),
        DayWeather(dayOfWeek: "Saturday", icon: .cloudSun, probability: 50, dayTemp: 32, nightTemp: 28),
        DayWeather(dayOfWeek: "Sunday", icon: .sun, probability: 50, dayTemp: 33, nightTemp: 28),
        DayWeather(dayOfWeek: "Monday", icon: .cloud, probability: 50, dayTemp: 31, nightTemp: 27),
        DayWeather(dayOfWeek: "Tuesday", icon: .sun, probability: 50, dayTemp: 29, nightTemp: 25)
    ]
    
    var model: WeatherModel
    
    var router: Router
    
    init(router: Router) {
        model = WeatherModel(icon: .sun,
                             isLocal: true,
                             temperature: 25,
                             currentTime: Date(),
                             uvIndex: 4,
                             rainProbability: 10,
                             airQuality: 80,
                             hourlyWeather: hours,
                             dailyWeather: days,
                             latitude: 46.5, longtitude: 30.7)
        self.router = router
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button {
                    print("Нажата кнопка НАЗАТТ")
                    router.back()
                } label: {
                    AppAssets.arrowBack.swiftUIImage
//                        .frame(width: 40)
                        .frame(height: 44)
                }

                Spacer()
                
                Button {
                    print("Нажата кнорка добавить")
                    router.showCitiesList()
                    // ТУТ ДОЛЖНА ПОМЕНЯТЬСЯ КНОПКА, НА ЗЕЛЕНУЮ
                    
                } label: {
                    HStack(spacing: 8) {
                        Text("Add to list")
                            .foregroundColor(Color.black)
                        AppAssets.add.swiftUIImage
                    }
                    .padding(.all, 14)
                } .roundedBackground()
                    
            }
//            .padding(.top, 12)
            .frame(height: 44)
            
            ScrollView {
                
                InformationView(model: model)
            }
            .padding(.top, 24)
            
        }
        .padding(.top, 12)
        .padding(.horizontal, 24)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(router: Router())
    }
}
