//
//  String+Date.swift
//
//
//  Created  11/12/2023.
//

import Foundation

extension String {
    public func convertStringToDate() -> Date? {
        let commonDateFormats = [
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            "yyyy-MM-dd'T'HH:mm:ssZ",
            "yyyy-MM-dd",
            "dd/MM/yyyy HH:mm:ss",
            "dd/MM/yyyy",
            "MM/dd/yyyy HH:mm:ss",
            "MM/dd/yyyy",
            "yyyyMMdd",
            "yyyy-MM-dd'T'HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss.SSS",
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSS",
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS",
        ]

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Adjust the locale as needed

        for format in commonDateFormats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: self) {
                return date
            }
        }
        return nil
    }
    
    public func convertStringToTime() -> Time? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        let commonTimeFormats = [
            "HH:mm:ss",
            "HH:mm",
            "h:mm:ss a",
            "h:mm a",
        ]

        for format in commonTimeFormats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: self) {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute], from: date)

                if let hours = components.hour, let minutes = components.minute {
                    return Time(hours: hours, minutes: minutes)
                }
            }
        }
        return nil
    }
}
