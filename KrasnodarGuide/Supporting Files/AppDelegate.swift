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

        guard
            let tabBarController = window?.rootViewController as? UITabBarController,
            let mainNavigationController = tabBarController.viewControllers?[TabBarMenu.Main.rawValue] as? UINavigationController,
            let _ = mainNavigationController.topViewController as? MainVC
        else { fatalError() }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let containerViewController = MainContainerVC()
        
        window!.rootViewController = containerViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}
