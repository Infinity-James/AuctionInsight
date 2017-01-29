//
//  Resource.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import Foundation

//  MARK: Resource
struct Resource<A> {
	//  MARK: Properties
	///	The remote location of this resource.
	let url: URL
	///	A function to parse the data into the expected type.
	let parse: (Data) -> A?
	///	The type of HTTP request made by this resource.
	let method: HTTPMethod<Data>
	//  MARK: Initialization
	init(url: URL, parse: @escaping (Data) -> A?, method: HTTPMethod<Data> = .get) {
		self.url = url
		self.parse = parse
		self.method = method
	}
}
//  MARK: JSON
extension Resource {
	init(url: URL, parseJSON: @escaping ([JSONValue]) -> A?) {
		self.url = url
		self.method = .get
		self.parse = { data in
			guard let json = try? JSONSerialization.jsonValue(with: data, options: []) else { return nil }
			return parseJSON(json)
		}
	}
	init(url: URL, method: HTTPMethod<[JSONValue]>, parseJSON: @escaping ([JSONValue]) -> A?) throws {
		self.url = url
		self.method = try method.map { json in
			try JSONSerialization.data(withJSONObject: json, options: [])
		}
		self.parse = { data in
			guard let json = try? JSONSerialization.jsonValue(with: data, options: []) else { return nil }
			return parseJSON(json)
		}
	}
}
extension Resource where A: RangeReplaceableCollection {
	init(url: URL, method: HTTPMethod<[JSONValue]> = .get, parseElement: @escaping (JSONValue) -> A.Iterator.Element?) throws {
		self = try Resource(url: url, method: method, parseJSON: { json in
			let result = json.flatMap(parseElement)
			return A(result)
		})
	}
}

//  MARK: HTTP Method
enum HTTPMethod<A> {
	///	GET method.
	case get
	///	POST method, with the data to post.
	case post(data: A)
	///	The method as it's respective string.
	var method: String {
		switch self {
		case .get: return "GET"
		case .post: return "POST"
		}
	}
	//  MARK: Data Manipulation
	/**
	Attempts to map the data into another HTTPMethod instance.
	*/
	func map<B>(f: (A) throws -> B) rethrows -> HTTPMethod<B> {
		switch self {
		case .get: return .get
		case .post(let data): return .post(data: try f(data))
		}
	}
}

//  MARK: JSONSerialization - JSONValue
extension JSONSerialization {
	static func jsonValue(with data: Data, options: JSONSerialization.ReadingOptions) throws -> [JSONValue] {
		let json: [JSONValue]
		let untypedJSON = try JSONSerialization.jsonObject(with: data, options: [])
		if let typedJSON = untypedJSON as? JSONValue {
			json = [typedJSON]
		} else if let typedJSON = untypedJSON as? [JSONValue] {
			json = typedJSON
		} else {
			throw NSError(domain: "NSJSONSerialization", code: 0, userInfo: nil)
		}
		return json
	}
}
