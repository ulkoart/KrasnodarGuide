//
//  Locations.swift
//  KrasnodarGuide
//
//  Created by user on 11.06.2021.
//

import UIKit
import CoreLocation
import MapKit

final class Locations: NSObject, Serviceable {
    
    fileprivate var router: Router = ServiceLocator.shared.inject()
    
    //let locationManager = CLLocationManager()
    let locationManager: CLLocationManager = .init()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
}

extension Locations: CLLocationManagerDelegate {
    
    func checkLocationAuthorization(mapView: MKMapView) {
        
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            switch status {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                break
            case .denied:
                router.showAlert(
                    title: "Ваше местонахождение не определено",
                    message: "Для включения: Настройки -> Краснодар -> Location"
                )
            case .authorizedAlways:
                break
            case .authorizedWhenInUse:
                mapView.showsUserLocation = true
                break
            @unknown default:
                fatalError("CLLocationManager error")
            }
        } else {
            router.showAlert(
                title: "Геосервис выключен",
                message: "Для включения: Настройки -> Приватность -> Геосервис включить"
            )
        }
    }
    
}
