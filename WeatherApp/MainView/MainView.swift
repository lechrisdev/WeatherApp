//
//  MainView.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            CurrentTemperatureView(title: "Odesa", icon: .cloud, isLocal: true, temperature: 8)
            DetailsView(time: "12.00 PM", uv: 2, rain: 60, aq: 25).padding(.horizontal, 24)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
