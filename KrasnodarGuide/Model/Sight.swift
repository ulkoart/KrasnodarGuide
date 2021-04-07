//
//  Sight.swift
//  KrasnodarGuide
//
//  Created by user on 03.04.2021.
//

import Foundation
import MapKit

final class Sight: NSObject, Codable {
    //  почему не struct ? NSObject ?
    // ToDO перенести MKAnnotation в отдельный метод
    let name: String
    let lat: Float
    let lon: Float
    let category: Category
    
    enum Category: String, Codable {
        case architectural
        case historical
    }
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
    
    var markerTintColor: UIColor  {
        switch category {
        case .architectural:
            return .red
        case .historical:
            return .blue
        }
    }
    
    var markerImage: UIImage {
        switch category {
        case .architectural:
            return #imageLiteral(resourceName: "architectural")
        case .historical:
            return #imageLiteral(resourceName: "historical")
        }
    }
}

