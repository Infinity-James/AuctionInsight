//
//  Auction.swift
//  AuctionInsight
//
//  Created by James Valaitis on 27/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import Foundation

//  MARK: Auction
struct Auction {
	let id: Int
	let title: String
	let rate: Double
	let centsTotal: Int
	let term: Int
	let riskBand: String
	let closeTime: Date
}

//  MARK: JSON Initializable
private let idKey = "id"
private let titleKey = "title"
private let rateKey = "rate"
private let centsTotalKey = "amount_cents"
private let termKey = "term"
private let riskBandKey = "risk_band"
private let closeTimeKey = "close_time"
extension Auction: JSONInitializable {
	init?(json: JSONValue) {
		guard let id = json[idKey] as? Int,
			let title = json[titleKey] as? String,
			let rate = json[rateKey] as? Double,
			let centsTotal = json[centsTotalKey] as? Int,
			let term = json[termKey] as? Int,
			let riskBand = json[riskBandKey] as? String,
			let closeTimeString = json[closeTimeKey] as? String else { return nil }
		
		self.id = id
		self.title = title
		self.rate = rate
		self.centsTotal = centsTotal
		self.term = term
		self.riskBand = riskBand
		self.closeTime = Date()
	}
}
