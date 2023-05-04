//
//  DateExtensions.swift
//  WeatherApp
//
//  Created by Le Chris on 24.03.2023.
//

import Foundation
import SwiftUI

extension Date {
        
    init(string: String) {
        let date: Date
        var dateFormatter: DateFormatter?
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "yyyy-MM-dd'T'HH:mm"
        date = dateFormatter?.date(from: string) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    init(stringDay: String) {
        let date: Date
        var dateFormatter: DateFormatter?
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "yyyy-MM-dd"
        date = dateFormatter?.date(from: stringDay) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}

enum DateStringStyle {
    case amPm
    case fullFormat
}

extension Date {
    
    func toString(style: DateStringStyle, timezone: TimeZone? = nil) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        if let timezone {
            dateFormatter.timeZone = timezone
        }
        
        
        switch style {
        case .amPm:
            dateFormatter.dateFormat = "h:mm a"
        case .fullFormat:
            dateFormatter.dateFormat = "HH:mm"
        }
        
        let date = dateFormatter.string(from: self)

        return date
    }
    
    func dayOfTheWeek() -> String? {
            let weekdays = [
                AppLocalization.sunday,
                AppLocalization.monday,
                AppLocalization.tuesday,
                AppLocalization.wednesday,
                AppLocalization.thursday,
                AppLocalization.friday,
                AppLocalization.saturday
            ]

        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: self)
        return weekdays[day - 1]
    }
}
