//
//  Auction+ERA.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Estimated Return Amount
extension Auction {
	///	A calculated estimate of the return amount for this auction.
	var estimatedReturnAmount: Double {
		return (1 + rate - riskBand.estimatedBadDebt - 0.01) * 20
	}
}
extension Auction.RiskBand {
	var estimatedBadDebt: Double {
		switch self {
		case .aPlus:	return 0.01
		case .a:		return 0.02
		case .b:		return 0.03
		case .c:		return 0.04
		case .d:		return 0.05
		}
	}
}
