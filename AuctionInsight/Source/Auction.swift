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
