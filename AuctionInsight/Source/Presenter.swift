//
//  Presenter.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

//  MARK: Presenter
/**
Presenter protocol declaration that represents the most basic abstraction of a presenter.
 */
protocol Presenter: class {
	associatedtype View : UI
	///	The presenter's view to manage.
	weak var ui: View? { get }
	/**
	Use this method to attach a view with the presenter
	- Parameter view:	Pass a View type representing the view to be handled.
	*/
	func attachView(_ view: View)
	
	/**
	This method will detach the view from the presenter.
	*/
	func detachView()
}
