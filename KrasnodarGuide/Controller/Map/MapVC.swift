//
//  MapVC.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    private var sights: [Sight] = []
    
    @IBAction func toCenterButtonPressed(_ sender: UIButton) {
        setupMap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.register(SightAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        setupMap()
        sights = Sight.getSights()
        mapView.addAnnotations(sights)
    }
    

}
