//
//  AuctionListPresenter.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Auction List Presenter
final class AuctionListPresenter<View: AuctionUI>: Presenter {
	//  MARK: Properties
	var ui: View?
}
//  MARK: Presenter
extension AuctionListPresenter {
	func attachView(_ view: View) {
		ui = view
	}
	func detachView() {
		ui = nil
	}
}
