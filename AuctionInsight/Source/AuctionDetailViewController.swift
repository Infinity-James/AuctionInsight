//
//  AuctionDetailViewController.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: Auction Detail View Controller
final class AuctionDetailViewController: UIViewController, AuctionDetailUI {
	//  MARK: Properties
	var presenter: AuctionDetailPresenter<AuctionDetailViewController>?
	@IBOutlet fileprivate var estimateReturnLabel: UILabel?
	@IBOutlet fileprivate var rateLabel: UILabel?
	@IBOutlet fileprivate var centsTotalLabel: UILabel?
	@IBOutlet fileprivate var termLabel: UILabel?
	@IBOutlet fileprivate var riskBandLabel: UILabel?
	@IBOutlet fileprivate var closeTimeLabel: UILabel?
	fileprivate let closeTimeFormatter: DateFormatter = {
		var formatter = DateFormatter()
		formatter.dateStyle = .short
		return formatter
	}()
}
//  MARK: AuctionDetailUI
extension AuctionDetailViewController {
	func display(auction: Auction) {
		estimateReturnLabel?.text = "\(auction.estimatedReturnAmount)"
		rateLabel?.text = "\(auction.rate)"
		centsTotalLabel?.text = "\(auction.centsTotal)"
		termLabel?.text = "\(auction.term)"
		riskBandLabel?.text = auction.riskBand.rawValue
		closeTimeLabel?.text = closeTimeFormatter.string(from: auction.closeTime)
	}
}
//  MARK: View Lifecycle
extension AuctionDetailViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.attachView(self)
	}
	override func didReceiveMemoryWarning() {
		presenter?.detachView()
		super.didReceiveMemoryWarning()
	}
}
