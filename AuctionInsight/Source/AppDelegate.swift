//
//  AppDelegate.swift
//  AuctionInsight
//
//  Created by James Valaitis on 26/01/2017.
//  Copyright © 2017 &Beyond. All rights reserved.
//

import UIKit

//  MARK: App Delegate
@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
	//  MARK: Properties
	var window: UIWindow?
	let wireframe = AuctionWireframe()
	
	//  MARK: UIApplicationDelegate
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let auctionVC = wireframe.auctionListViewController
		let navigationController = UINavigationController(rootViewController: auctionVC)
		window?.rootViewController = navigationController
		return true
	}
}
