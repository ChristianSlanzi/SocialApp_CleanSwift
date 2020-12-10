//
//  String+Date.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 10.12.20.
//

import Foundation

// MARK: - DATE FROM STRING
public extension String{
    func toDate(format: String, locale: Locale) -> Date? {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = format
        dateTimeFormatter.timeZone = TimeZone.current
        dateTimeFormatter.locale = locale
        return dateTimeFormatter.date(from: self)
    }
}
