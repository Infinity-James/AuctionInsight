//
//  AuctionDetailPresenter.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Auction Detail Presenter
final class AuctionDetailPresenter<View: AuctionDetailUI>: Presenter {
	//  MARK: Properties
	weak var ui: View?
	let auction: Auction
	//  MARK: Initialization
	init(auction: Auction) {
		self.auction = auction
	}
}
//  MARK: Presenter
extension AuctionDetailPresenter {
	func attachView(_ view: View) {
		ui = view
		ui?.set(title: auction.title)
		ui?.display(auction: auction)
	}
	func detachView() {
		ui = nil
	}
}
