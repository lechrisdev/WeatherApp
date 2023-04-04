//
//  InformationView.swift
//  WeatherApp
//
//  Created by Le Chris on 31.03.2023.
//

import SwiftUI

struct InformationView: View {
    
    let stringData = "2023-03-16T13:57"
    let model: WeatherModel
    
    init(model: WeatherModel) {
        self.model = model
//        let date = Date(string: stringData)
//        print(">>>>", date)
//        print(">>>>", date.toString(style: .fullFormat))
//        print(">>>>", date.toString(style: .amPm))
    }
    
    var body: some View {
                
        ScrollView {
            Group {
                CurrentTemperatureView(title: model.cityName,
                                       icon: model.icon,
                                       isLocal: model.isLocal,
                                       temperature: model.temperature)
                DetailsView(time: model.currentTime.toString(style: .amPm),
                            uv: model.uvIndex,
                            rain: model.rainProbability,
                            aq: model.airQuality)
                .roundedBackground()
                HourlyWeather(hours: model.hourlyWeather)
                    .roundedBackground()
                    .padding(.top, 12)
                
                // СЮДА ВСТАВИТЬ ВЬЮ С ЕЖЕНЕДЕЛЬНОЙ ПОГОДОЙ
                WeekForecast(days: model.dailyWeather)
                    .padding(.top, 12)
                
                MapView(lat: 46.5, long: 30.7)
                    .padding(.top, 12)
            }
//            .padding(.horizontal, 24)
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        
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
        
        let model = WeatherModel(cityName: "Odesa",
                                 icon: .sun,
                                 isLocal: true,
                                 temperature: 25,
                                 currentTime: Date(),
                                 uvIndex: 4,
                                 rainProbability: 10,
                                 airQuality: 80,
                                 hourlyWeather: hours,
                                 dailyWeather: days,
                                 latitude: 46.5, longtitude: 30.7)
        
        InformationView(model: model)
    }
}
