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
	//  MARK: Properties
	let id: Int
	let title: String
	let rate: Double
	let centsTotal: Int
	let term: Int
	let riskBand: RiskBand
	let closeTime: Date
	//  MARK: Risk Band
	enum RiskBand: String {
		case aPlus = "A+"
		case a = "A"
		case b = "B"
		case c = "C"
		case d = "D"
	}
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
			let riskBandRaw = json[riskBandKey] as? String,
			let riskBand = RiskBand(rawValue: riskBandRaw),
			let closeTimeString = json[closeTimeKey] as? String,
			let closeTime = closeTimeString.dateFromISO8601 else { return nil }
		
		self.id = id
		self.title = title
		self.rate = rate
		self.centsTotal = centsTotal
		self.term = term
		self.riskBand = riskBand
		self.closeTime = closeTime
	}
}
//  MARK: Equatable
extension Auction: Equatable {}
func ==(left: Auction, right: Auction) -> Bool {
	return left.id == right.id &&
		left.title == right.title &&
		left.rate == right.rate &&
		left.centsTotal == right.centsTotal &&
		left.term == right.term &&
		left.riskBand == right.riskBand &&
		left.closeTime == right.closeTime
}
