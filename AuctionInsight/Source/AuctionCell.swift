//
//  AuctionCell.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: Auction Cell
final class AuctionCell: UITableViewCell {
	//  MARK: Properties
	///	The title of the auction.
	var title: String? {
		didSet {
			titleLabel?.text = title
		}
	}
	@IBOutlet fileprivate var titleLabel: UILabel? {
		didSet {
			titleLabel?.text = title
		}
	}
	///	The close of the auction.
	var closeTime: Date? {
		didSet {
			if let closeTime = closeTime  {
				closeTimeLabel?.text = closeDateFormatter.string(from: closeTime)
			} else { closeTimeLabel?.text = nil }
		}
	}
	@IBOutlet fileprivate var closeTimeLabel: UILabel? {
		didSet {
			if let closeTime = closeTime  {
				closeTimeLabel?.text = closeDateFormatter.string(from: closeTime)
			} else { closeTimeLabel?.text = nil }
		}
	}
	fileprivate let closeDateFormatter: DateFormatter = {
		var formatter = DateFormatter()
		formatter.dateStyle = .short
		return formatter
	}()
	///	The risk band that the auction falls into.
	var riskBand: Auction.RiskBand? {
		didSet {
			riskBandLabel?.text = riskBand?.rawValue
		}
	}
	@IBOutlet fileprivate var riskBandLabel: UILabel? {
		didSet {
			riskBandLabel?.text = riskBand?.rawValue
		}
	}
}
