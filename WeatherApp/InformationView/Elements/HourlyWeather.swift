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
    
    @State var hours: [HourWeather] // ДАННЫЕ О ПОГОДЕ
    let timezone: String
    
    func isCurrentTime(time: String) -> Bool {
        var calendar = Calendar.current
        let timezone = TimeZone(abbreviation: timezone)
        calendar.timeZone = timezone ?? .current
        var minutes = String(calendar.component(Calendar.Component.minute, from: Date()))
        if minutes.count == 1 {
            minutes = "0" + minutes
        }
        let nowDate = calendar.dateComponents(in: timezone ?? .current, from: Date()).date!
        let nowDateString = nowDate.toString(style: .amPm, timezone: timezone)
        let nowDateStringZeroMinutes = nowDateString.replacingOccurrences(of: String(minutes), with: "00")

        return time == nowDateStringZeroMinutes
    }
    
    func filterWeather() {
        guard let currentTimeIndex = hours.firstIndex(where: { isCurrentTime(time: $0.time) }) else { return }
        var firstRange = 0
        var lastRange = hours.count - 1
        if currentTimeIndex >= 6 {
            firstRange = currentTimeIndex - 6
        }
        lastRange = currentTimeIndex + 24
        let slice = hours[firstRange...lastRange]
        self.hours = Array(slice)
    }
    
    var body: some View {
        ScrollViewReader { reader in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(hours), id: \.self) { hour in
                        
                        // СОЗДАЕМ ЯЧЕЙКУ С ДАННЫМИ О ПОГОДЕ
                        ZStack {
                            Color.black.opacity(isCurrentTime(time: hour.time) ? 0.05 : 0)
                                .blur(radius: 15)
                            HourCell(temperature: hour.temperature,
                                     icon: hour.icon,
                                     time: hour.time)
                            .id(isCurrentTime(time: hour.time) ? 1 : 0)
                        }
                    }
                }.onAppear {
                    filterWeather()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            reader.scrollTo(1, anchor: .leading)
                        }
                    }
                }
            }
        }
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
        HourlyWeather(hours: hours,
                      timezone: "EDT")
    }
}
