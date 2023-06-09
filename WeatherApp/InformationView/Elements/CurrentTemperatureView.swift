//
//  CurrentTemperatureView.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

struct CurrentTemperatureView: View {
    
    let title: String
    let icon: Icon
    let isLocal: Bool
    let temperature: Int
    
    init(title: String, icon: Icon, isLocal: Bool, temperature: Int) {
        self.title = title
        self.icon = icon
        self.isLocal = isLocal
        self.temperature = temperature
    }
    
    var body: some View {
        VStack(spacing: 0) {
            icon.image
                .padding(.bottom, 25)
            HStack {
                Text(title)
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                if isLocal {
                    AppAssets.geo.swiftUIImage
                }
            }
//            .frame(height: 20)
            Text("\(temperature)°")
                .font(.system(size: 70))
                .fontWeight(.semibold)
                .padding(.top, 15)
        }
    }
}

struct CurrentTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CurrentTemperatureView(title: "Odesatgrg grgrgrg rgrgrg rgrg", icon: .cloudSun, isLocal: true, temperature: 42)
            CurrentTemperatureView(title: "Kharkiv", icon: .sun, isLocal: false, temperature: 42)
            CurrentTemperatureView(title: "New York", icon: .cloudThunderbold, isLocal: true, temperature: 42)
        }
    }
}
