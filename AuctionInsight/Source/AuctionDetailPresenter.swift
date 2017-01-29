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
}
//  MARK: Presenter
extension AuctionDetailPresenter {
	func attachView(_ view: View) {
		ui = view
	}
	func detachView() {
		ui = nil
	}
}
