//
//  AppDelegate.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
		let containerViewController = TabBarController()
		window!.rootViewController = containerViewController
		window!.makeKeyAndVisible()

		return true
	}
}
