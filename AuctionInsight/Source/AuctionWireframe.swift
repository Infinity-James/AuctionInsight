//
//  MainWireframe.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: Auction Wireframe
final class AuctionWireframe: Wireframe {
	//  MARK: Properties
	let auctionService = AuctionService(client: APIClient())
	//  MARK: Wireframe
	let storyboardName = "Auction"
	//  MARK: View Controllers
	var auctionListViewController: UIViewController {
		let vc = storyboard.instantiateViewController(AuctionListViewController.self)
		vc.presenter = AuctionListPresenter<AuctionListViewController>(auctionService: auctionService, wireframe: self)
		return vc
	}
	func auctionDetailViewController(for auction: Auction) -> UIViewController {
		let vc = storyboard.instantiateViewController(AuctionDetailViewController.self)
		vc.presenter = AuctionDetailPresenter<AuctionDetailViewController>(auction: auction)
		return vc
	}
}
