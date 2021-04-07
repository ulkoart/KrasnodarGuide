//
//  Sight.swift
//  KrasnodarGuide
//
//  Created by user on 03.04.2021.
//

import Foundation
import MapKit

class Sight: NSObject, Codable {
    //  почему не struct ? NSObject ?
    let name: String
    let lat: Float
    let lon: Float
    
}

extension Sight: MKAnnotation {
    var title: String? {
        return self.name
    }
    
    var coordinate: CLLocationCoordinate2D {
        let latitude: CLLocationDegrees = CLLocationDegrees(self.lat)
        let longitude: CLLocationDegrees = CLLocationDegrees(self.lon)
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension Sight {
    static func getSights() -> [Sight] {
        guard
            let url = Bundle.main.url(forResource: "sights", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else { return [] }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Sight].self, from: data)
        } catch { return [] }
    }
    
    var markerTintColor: UIColor  { return .red }
}

