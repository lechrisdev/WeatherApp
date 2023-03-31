//
//  InformationView.swift
//  WeatherApp
//
//  Created by Le Chris on 31.03.2023.
//

import SwiftUI

struct InformationView: View {
    
    let stringData = "2023-03-16T13:57"
    
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
    
    init() {
        let date = Date(string: stringData)
        print(">>>>", date)
        print(">>>>", date.toString(style: .fullFormat))
        print(">>>>", date.toString(style: .amPm))
    }
    
    var body: some View {
                
        ScrollView {

            CurrentTemperatureView(title: "Odesa", icon: .cloud, isLocal: true, temperature: 8)
            DetailsView(time: "12.00 PM", uv: 2, rain: 60, aq: 25)
                .roundedBackground()
                .padding(.horizontal, 24)
            HourlyWeather(hours: hours)
                .roundedBackground()
                .padding(.top, 12)
                .padding(.horizontal, 24)
            
            // СЮДА ВСТАВИТЬ ВЬЮ С ЕЖЕНЕДЕЛЬНОЙ ПОГОДОЙ
            WeekForecast(days: days)
                .padding(.top, 12)
                .padding(.horizontal, 24)
            
            MapView(lat: 46.5, long: 30.7)
                .padding(.top, 12)
                .padding(.horizontal, 24)
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
