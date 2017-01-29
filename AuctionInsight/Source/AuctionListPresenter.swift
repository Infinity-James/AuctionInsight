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
	weak var ui: View?
	let auctionService: AuctionService
	unowned let wireframe: AuctionWireframe
	//  MARK: Initialzation
	init(auctionService: AuctionService, wireframe: AuctionWireframe) {
		self.auctionService = auctionService
		self.wireframe = wireframe
	}
}
//  MARK: Auction Management
private extension AuctionListPresenter {
	func loadAuctions() {
		auctionService.auctions { [weak self] auctions, error in
			guard let strongSelf = self else { return }
			guard let auctions = auctions, error == nil else {
				print("Error occurred whilst fetching auctions: \(error)")
				return
			}
			strongSelf.ui?.show(auctions: auctions)
		}
	}
}
//  MARK: Selection
extension AuctionListPresenter {
	func selected(auction: Auction) {
		
	}
}
//  MARK: Presenter
extension AuctionListPresenter {
	func attachView(_ view: View) {
		ui = view
		ui?.set(title: "Auctions")
		loadAuctions()
	}
	func detachView() {
		ui = nil
	}
}
