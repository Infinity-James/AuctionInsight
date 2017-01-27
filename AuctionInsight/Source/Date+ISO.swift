//
//  Date+ISO.swift
//  AuctionInsight
//
//  Created by James Valaitis on 27/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import Foundation

//  MARK: Date + ISO
extension Date {
	///	A date format used to create date from en_US_POSIX string.
	static let iso8601Formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
		return formatter
	}()
	///	The date as an ISO 8601 formatted string.
	var iso8601: String {
		return Date.iso8601Formatter.string(from: self)
	}
}
extension String {
	///	A date from this string if it is ISO 9602 formatted.
	var dateFromISO8601: Date? {
		return Date.iso8601Formatter.date(from: self)
	}
}
