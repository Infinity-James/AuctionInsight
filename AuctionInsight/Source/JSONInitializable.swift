//
//  JSONInitializable.swift
//  AuctionInsight
//
//  Created by James Valaitis on 27/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Type
///	Defines a dictionary containing information in JSON format.
typealias JSONValue = [String: Any]

//  MARK: JSON Initializable
/**
	Defines an object capable of being initialized from JSON.
 */
protocol JSONInitializable {
	init?(json: JSONValue)
}
