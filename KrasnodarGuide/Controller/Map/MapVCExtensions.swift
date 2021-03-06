//
//  MapVCExtensions.swift
//  KrasnodarGuide
//
//  Created by user on 03.04.2021.
//

import Foundation
import MapKit

extension MapVC {
    func setupMap() {
        let initialLocation = CLLocation(latitude: 45.035561069683524, longitude: 38.95591531310487)
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension MapVC: MKMapViewDelegate {
    
//    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        let mapLatitude = mapView.centerCoordinate.latitude
//        let mapLongitude = mapView.centerCoordinate.longitude
//        let center = "Latitude: \(mapLatitude) Longitude: \(mapLongitude)"
//        print(center)
//    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard
            let annotation = view as? SightAnnotationView,
            let sight = annotation.sight
            else { return }
        
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MapDetailVC") as? MapDetailVC else {
                return
        }
        
        detailVC.sight = sight
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    /* метод для работы с анотицией, заменен на mapView.register
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
     
     guard
     let annotation = annotation as? Sight else { return nil }
     
     let identifier = "sight"
     var pinView: SightMarkerView
     
     if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? SightMarkerView {
     dequeuedView.annotation = annotation
     pinView = dequeuedView
     } else {
     pinView = SightMarkerView(annotation: annotation, reuseIdentifier: identifier)
     }
     return pinView
     }
     */
}

extension MapVC: CLLocationManagerDelegate {
    
    func checkLocationAuthorization() {
        
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            switch status {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                break
            case .denied:
                self.showAlert(
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
            self.showAlert(
                title: "Геосервис выключен",
                message: "Для включения: Настройки -> Приватность -> Геосервис включить"
            )
        }
    }
    
}


extension MapVC {
    func showAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
}
