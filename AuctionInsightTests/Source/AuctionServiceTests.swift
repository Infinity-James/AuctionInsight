//
//  AuctionServiceTests.swift
//  AuctionInsight
//
//  Created by James Valaitis on 28/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

@testable import AuctionInsight
import XCTest

//  MARK: Auction Service Tests
final class AuctionServiceTests: XCTestCase {
	//  MARK: Properties
	lazy var sut: AuctionService = { return AuctionService(client: self.mockClient) }()
	var mockClient = MockAuctionClient()
}
//  MARK: Set Up 
extension AuctionServiceTests {
	override func setUp() {
		super.setUp()
		mockClient = MockAuctionClient()
		sut = AuctionService(client: mockClient)
	}
}
//  MARK: Auction Fetch
extension AuctionServiceTests {
	func testAuctionFetch_getAuctions() {
		//	create sample auctions and feed to client to test service
		let expectedAuctions = [
			Auction(id: 0, title: "0", rate: 0.0, centsTotal: 0, term: 0, riskBand: .c, closeTime: Date()),
			Auction(id: 1, title: "1", rate: 0.1, centsTotal: 1000000, term: 1, riskBand: .b, closeTime: Date()),
			Auction(id: 2, title: "2", rate: 0.2, centsTotal: 2000000, term: 2, riskBand: .a, closeTime: Date()),
			Auction(id: 3, title: "3", rate: 0.3, centsTotal: 3000000, term: 3, riskBand: .aPlus, closeTime: Date()),
			Auction(id: 4, title: "4", rate: 0.4, centsTotal: 4000000, term: 4, riskBand: .aPlus, closeTime: Date()),
			Auction(id: 5, title: "5", rate: 0.5, centsTotal: 5000000, term: 5, riskBand: .aPlus, closeTime: Date())
		]
		mockClient.auctions = expectedAuctions
		//	test whether service returns auctions 'fetched' by client
		let auctionExpectation = expectation(description: "Auctions fetched.")
		sut.auctions { auctions, error in
			guard let auctions = auctions, error == nil else {
				XCTFail("Auction fetch failed: \(error)")
				return
			}
			XCTAssertEqual(auctions, expectedAuctions)
			auctionExpectation.fulfill()
		}
		waitForExpectations(timeout: 5.0, handler: nil)
	}
}
//  MARK: Mock API Client
final class MockAuctionClient: NetworkClient {
	//  MARK: Properties
	var auctions = [Auction]()
	var error: Error?
	var loadCalled: ((Resource<[Auction]>?, Error?) -> ())?
	//  MARK: NetworkClient
	func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A>) -> ()) {
		guard error == nil else {
			loadCalled?(nil, error)
			completion(Result<A>(nil, or: error!))
			return
		}
		guard A.self == [Auction].self else {
			loadCalled?(nil, nil)
			completion(Result<A>(nil, or: NetworkClientError.other))
			return
		}
		let parse = { (data: Data) in return resource.parse(data) as? [Auction] }
		let auctionsResource = Resource(url: resource.url, parse: parse, method: resource.method)
		loadCalled?(auctionsResource, nil)
		completion(Result.success(auctions as! A))
	}
}
