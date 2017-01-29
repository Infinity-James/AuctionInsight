//
//  NetworkClient.swift
//  AuctionInsight
//
//  Created by James Valaitis on 28/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Network Client
protocol NetworkClient {
	/**
	Loads the provided resource.
	
	- Parameter resource:	The resource to be loaded.
	- Parameter completion:	Called when the resource has finished loading, successfully or not.
	 */
	func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A>) -> ())
}
