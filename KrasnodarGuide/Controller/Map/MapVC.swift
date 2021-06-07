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
    static let identifier = "MapVC"
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager: CLLocationManager = .init()
    var forcePushItemName: String?
    
    private var sights: [Sight] = []
    
    @IBAction func toCenterButtonPressed(_ sender: UIButton) {
        setupMap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sights = Sight.getSights()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.register(SightAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        setupMap()
        
        mapView.addAnnotations(sights)
        checkLocationAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let itemName = self.forcePushItemName else { return }
        forcePush(itemName)
    }
    
    private func forcePush(_ itemName: String) {
        let sight = sights.filter{ $0.name == itemName }.first
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MapDetailVC") as? MapDetailVC else {
                return
        }
        detailVC.sight = sight
        self.forcePushItemName = nil
        navigationController?.pushViewController(detailVC, animated: false)
        
    }
}
