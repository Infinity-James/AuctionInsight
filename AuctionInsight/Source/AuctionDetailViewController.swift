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
