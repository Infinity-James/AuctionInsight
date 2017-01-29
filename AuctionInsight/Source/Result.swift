//
//  Result.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Result
enum Result<A> {
	///	Operation succeeded.
	case success(A)
	///	Operation failed.
	case error(Error)
}
//  MARK: Initialization
extension Result {
	public init(_ value: A?, or error: Error) {
		if let value = value {
			self = .success(value)
		} else {
			self = .error(error)
		}
	}
	///	The result from the operation if it was successful.
	public var value: A? {
		guard case .success(let v) = self else { return nil }
		return v
	}
	///	The error if the operation failed.
	public var error: Error? {
		guard case .error(let error) = self else { return nil }
		return error
	}
}
//  MARK: Network Client Error
public enum NetworkClientError: Error {
	///	The requested required authentication.
	case notAuthenticated
	///	Miscellaneous error.
	case other
}
/**
Convenience function for logging the error of a result if it failed.
*/
func assertError<A>(_ result: Result<A>) {
	guard case let .error(e) = result else { return }
	assertionFailure("\(e)")
}
