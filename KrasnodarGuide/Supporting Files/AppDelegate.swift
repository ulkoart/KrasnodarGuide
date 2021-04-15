//
//  AppDelegate.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//

import UIKit
import CoreLocation

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        self.checkLocationAuthorization()
        
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    func checkLocationAuthorization() {
        
    }
}
