//
//  MapVCV2.swift
//  KrasnodarGuide
//
//  Created by Улько Артем Викторович on 25.09.2023.
//

import UIKit
import MapKit

final class MapVCV2: UIViewController {

	private var locations: Locations = ServiceLocator.shared.inject()

	private let mapView: MKMapView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		return $0
	}(MKMapView())

	private var sights: [Sight] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		configureMapView()
	}

	@objc func toCenterButtonPressed(_ sender: UIButton) {
		setCenter()
	}

	private func configureUI() {
		view.addSubview(mapView)
		NSLayoutConstraint.activate([
			mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}

	private func configureMapView() {
		sights = Sight.getSights()
		mapView.delegate = self
		mapView.register(
			SightAnnotationView.self,
			forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
		)
		setCenter()
		mapView.addAnnotations(sights)

		DispatchQueue.global().async { [weak self] in
			guard let self = self else { return }
			self.locations.checkLocationAuthorization(mapView: self.mapView)
		}
	}

	private func setCenter() {
		/// Координаты центра
		let initialLocation = CLLocation(
			latitude: 45.035561069683524,
			longitude: 38.95591531310487
		)
		let regionRadius: CLLocationDistance = 10000
		let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
		mapView.setRegion(coordinateRegion, animated: true)
	}
}

extension MapVCV2: MKMapViewDelegate {
	
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
}
