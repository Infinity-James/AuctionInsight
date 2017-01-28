//
//  AuctionManagerTests.swift
//  AuctionInsight
//
//  Created by James Valaitis on 28/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

@testable import AuctionInsight
import XCTest

//  MARK: Auction Manager Tests
final class AuctionManagerTests: XCTestCase {
	//  MARK: Properties
	lazy var sut: AuctionManager = { return AuctionManager(client: self.mockClient) }()
	var mockClient = MockAuctionClient()
}
//  MARK: Set Up 
extension AuctionManagerTests {
	override func setUp() {
		super.setUp()
		mockClient = MockAuctionClient()
		sut = AuctionManager(client: mockClient)
	}
}
//  MARK: Auction Fetch
extension AuctionManagerTests {
	func testAuctionFetch_getAuctions() {
	}
}
//  MARK: Mock API Client
final class MockAuctionClient: NetworkClient {
	
}
