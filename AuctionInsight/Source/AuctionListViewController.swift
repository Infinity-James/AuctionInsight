//
//  AuctionListViewController.swift
//  AuctionInsight
//
//  Created by James Valaitis on 26/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: Auction List View Controller
final class AuctionListViewController: UITableViewController, AuctionUI {
	//  MARK: Constants
	fileprivate let auctionCellReuseIdentifier = "AuctionCell"
	//  MARK: Properties
	///	The auctions to display.
	fileprivate var auctions = [Auction]()
}
//  MARK: AuctionUI
extension AuctionListViewController {
	func show(auctions: [Auction]) {
		self.auctions = auctions
		tableView.reloadData()
	}
}
//  MARK: UITableViewDataSource
extension AuctionListViewController {
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: auctionCellReuseIdentifier, for: indexPath) as? AuctionCell else {
			assertionFailure("Expected cell of type \(String(describing: AuctionCell.self))")
			return UITableViewCell()
		}
		let auction = auctions[indexPath.row]
		cell.title = auction.title
		cell.closeTime = auction.closeTime
		cell.riskBand = auction.riskBand
		return cell
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return auctions.count
	}
}
