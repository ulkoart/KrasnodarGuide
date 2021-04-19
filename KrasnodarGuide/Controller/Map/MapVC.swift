//
//  MapVC.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//

import UIKit
import MapKit
import CoreLocation

final class MapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    private var sights: [Sight] = []
    
    @IBAction func toCenterButtonPressed(_ sender: UIButton) {
        setupMap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        
        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.register(SightAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        setupMap()
        sights = Sight.getSights()
        mapView.addAnnotations(sights)
        
        
        checkLocationAuthorization()
        
        

    }
}
