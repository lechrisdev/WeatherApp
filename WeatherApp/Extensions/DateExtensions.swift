//
//  DateExtensions.swift
//  WeatherApp
//
//  Created by Le Chris on 24.03.2023.
//

import Foundation
import SwiftUI

public extension Date {
        
    init(string: String) {
        let date: Date
        var dateFormatter: DateFormatter?
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "yyyy-MM-dd'T'HH:mm"
        date = dateFormatter?.date(from: string) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}

public enum DateStringStyle {
//    case startDDMonthYear
//    case endedMonthDay
//    case mmddyy
//    case monthYear
//    case lastPost
//    case iso8601
    case amPm
    case fullFormat
}

public extension Date {
    func toString(style: DateStringStyle) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        
        switch style {
        case .amPm:
            dateFormatter.dateFormat = "h:mm a"
        case .fullFormat:
            dateFormatter.dateFormat = "HH:mm"
        }
        
        let date = dateFormatter.string(from: self)

        return date
    }
}
