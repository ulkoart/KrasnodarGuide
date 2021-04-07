//
//  SightMarkerView.swift
//  KrasnodarGuide
//
//  Created by user on 03.04.2021.
//

import Foundation
import MapKit

final class SightMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let sight = newValue as? Sight else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            markerTintColor = sight.markerTintColor
            if let letter = sight.name.first {
                glyphText = String(letter)
            }
        }
    }
}

final class SightAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let sight = newValue as? Sight else { return }
            tintColor = sight.markerTintColor
            image = sight.markerImage
        }
    }
}
