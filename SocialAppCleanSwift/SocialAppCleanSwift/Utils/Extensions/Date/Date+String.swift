//
//  Date+String.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 10.12.20.
//

import Foundation

// MARK: - DATE TO STRING
public extension Date {
    func toString(format: String = "MMMM dd yyyy", locale: Locale = Locale.current, timeZone: TimeZone = TimeZone.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
}
public extension Date {
    func toTimeString() -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "HH:mm:ss"
        return dateTimeFormatter.string(from: self)
    }
    func toShortTimeString() -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "HH:mm"
        return dateTimeFormatter.string(from: self)
    }
    func toDayMonthYearString() -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "dd.MM.yyyy"
        return dateTimeFormatter.string(from: self)
    }
    func toDayMonthYearTimeString() -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateTimeFormatter.string(from: self)
    }
    func toMonthYearString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"

        return dateFormatter.string(from: self)
    }
}
