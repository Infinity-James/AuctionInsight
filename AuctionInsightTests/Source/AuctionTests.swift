//
//  AuctionTests.swift
//  AuctionInsightTests
//
//  Created by James Valaitis on 26/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import XCTest
@testable import AuctionInsight

//  MARK: Auction Tests
final class AuctionTests: XCTestCase {}
//  MARK: Initialization Tests
extension AuctionTests {
	func testInit_setProperties() {
		let id = 3
		let title = "James Valaitis"
		let rate = 0.42
		let centsTotal = 4200000
		let term = 64
		let riskBand = Auction.RiskBand.aPlus
		let closeTime = Date()
		let auction = Auction(id: id, title: title, rate: rate, centsTotal: centsTotal, term: term, riskBand: riskBand, closeTime: closeTime)
		XCTAssertEqual(auction.id, id)
		XCTAssertEqual(auction.title, title)
		XCTAssertEqual(auction.rate, rate)
		XCTAssertEqual(auction.centsTotal, centsTotal)
		XCTAssertEqual(auction.term, term)
		XCTAssertEqual(auction.riskBand, riskBand)
		XCTAssertEqual(auction.closeTime, closeTime)
	}
	func testInitFromValidJSON_setProperties() {
		let id = 3
		let title = "James Valaitis"
		let rate = 0.42
		let centsTotal = 4200000
		let term = 64
		let riskBand = Auction.RiskBand.aPlus
		let closeTime = "2017-02-04T14:18:06.430Z"
		let json: JSONValue = [
			"id": id,
			"title": title,
			"rate": rate,
			"amount_cents": centsTotal,
			"term": term,
			"risk_band": riskBand.rawValue,
			"close_time": "2017-02-04T14:18:06.430Z"
		]
		guard let auction = Auction(json: json) else {
			XCTFail("Expected Auction to be initialized from valid JSON.")
			return
		}
		XCTAssertEqual(auction.id, id)
		XCTAssertEqual(auction.title, title)
		XCTAssertEqual(auction.rate, rate)
		XCTAssertEqual(auction.centsTotal, centsTotal)
		XCTAssertEqual(auction.term, term)
		XCTAssertEqual(auction.riskBand, riskBand)
		XCTAssertEqual(auction.closeTime, closeTime.dateFromISO8601!)
	}
	func testInitFromInvalidJSON_returnNil() {
		let id = 3
		let title = "James Valaitis"
		let rate = 0.42
		let incompleteJSON: JSONValue = [
			"id": id,
			"title": title,
			"rate": rate
		]
		let auction = Auction(json: incompleteJSON)
		XCTAssertNil(auction)
	}
}
