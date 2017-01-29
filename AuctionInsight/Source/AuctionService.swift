//
//  AuctionService.swift
//  AuctionInsight
//
//  Created by James Valaitis on 28/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Auction Service
final class AuctionService {
	//  MARK: Types
	/**
	A block called when an AuctionService operation completes.
	
	- Parameter auctions:	The fetched auctions if successful.
	- Parameter error:		An error which occurred if any.
	 */
	typealias AuctionServiceCompleted = ([Auction]?, Error?) -> ()
	//  MARK: Properties
	let client: NetworkClient
	//  MARK: Initialization
	init(client: NetworkClient) {
		self.client = client
	}
}
//  MARK: Auctions
extension AuctionService {
	/**
	Executes a fetch request for the available auctions.
	
	- Parameter completion:	Called when the operation has completed, successfully or not.
	 */
	func auctions(completion: AuctionServiceCompleted) {
		completion(nil, nil)
	}
}
