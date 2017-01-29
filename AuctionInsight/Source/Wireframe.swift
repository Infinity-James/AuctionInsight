//
//  Wireframe.swift
//  AuctionInsight
//
//  Created by James Valaitis on 29/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: Wireframe
protocol Wireframe {
	var storyboardName: String { get }
}
extension Wireframe {
	var storyboard: UIStoryboard {
		return UIStoryboard(name: storyboardName, bundle: nil)
	}
}
extension UIStoryboard {
	func instantiateViewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
		return self.instantiateViewController(withIdentifier: String(describing: VC.self)) as! VC
	}
}
