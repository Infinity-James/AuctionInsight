//
//  APIClient.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import Foundation

//  MARK: API Client
final class APIClient: NetworkClient {
	//  MARK: Properties
	let session: URLSession
	//  MARK: Initialization
	init(session: URLSession = URLSession(configuration: .default)) {
		self.session = session
	}
	//  MARK: NetworkClient
	func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A>) -> () = assertError) {
		session.dataTask(with: resource.url, completionHandler: { data, response, _ in
			let result: Result<A>
			if let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 401 {
				result = Result.error(NetworkClientError.notAuthenticated)
			} else {
				let parsed = data.flatMap(resource.parse)
				result = Result(parsed, or: NetworkClientError.other)
			}
			DispatchQueue.main.async { completion(result) }
		}) .resume()
	}

}
