//
//  AuctionUI.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Auction UI
protocol AuctionUI: UI {
	//  MARK: Auction Display
	func show(auctions: [Auction])
}
