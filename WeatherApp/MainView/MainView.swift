//
//  MainView.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

struct MainView: View {
    
    let hours = [
        HourWeather(temperature: 24, icon: .cloud, time: "12:00"),
        HourWeather(temperature: 24, icon: .cloudSun, time: "13:00"),
        HourWeather(temperature: 25, icon: .sun, time: "14:00"),
        HourWeather(temperature: 26, icon: .sun, time: "15:00"),
        HourWeather(temperature: 28, icon: .sun, time: "16:00"),
        HourWeather(temperature: 26, icon: .cloudSun, time: "17:00"),
        HourWeather(temperature: 24, icon: .rain, time: "18:00")
    ]
    
    var body: some View {
        ScrollView {
            SearchFieldView(onTap: { print("кнопка поиска нажалась, переход на другой экран") })
                .padding(.horizontal, 24)
                .padding(.top, 44)
            CurrentTemperatureView(title: "Odesa", icon: .cloud, isLocal: true, temperature: 8)
            DetailsView(time: "12.00 PM", uv: 2, rain: 60, aq: 25)
                .padding(.horizontal, 24)
            HourlyWeather(hours: hours)
                .padding(.top, 12)
                .padding(.horizontal, 24)
            MapView(lat: 46.5, long: 30.7)
                .padding(.top, 12)
                .padding(.horizontal, 24)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
