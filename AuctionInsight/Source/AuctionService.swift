//
//  AuctionService.swift
//  AuctionInsight
//
//  Created by James Valaitis on 28/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Auction Service
final class AuctionService {
	//  MARK: Properties
	let client: NetworkClient
	//  MARK: Initialization
	init(client: NetworkClient) {
		self.client = client
	}
}
