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
		let riskBand = "A+"
		let closeTime = Date()
		let auction = Auction(id: id, title: title, rate: rate, centsTotal: centsTotal, term: term, riskBand: riskBand, closeTime: closeTime)
	}
}
