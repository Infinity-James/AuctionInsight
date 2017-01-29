//
//  UI.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: UI
/**
Defines the abstraction for a UI element that is presenter dependent.
*/
protocol UI: class {
	func set(title: String?)
}
extension UIViewController: UI {
	func set(title: String?) {
		navigationItem.title = title
	}
}
