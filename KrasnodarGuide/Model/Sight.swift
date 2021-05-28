//
//  Sight.swift
//  KrasnodarGuide
//
//  Created by user on 03.04.2021.
//
// https://icon-icons.com https://www.flaticon.com

import Foundation
import MapKit

final class Sight: NSObject, Codable, CollectionViewItemProtocol {
    //  почему не struct ? NSObject ?
    // ToDO перенести MKAnnotation в отдельный метод
    let name: String
    var subName: String? {
        switch self.category {
       
        case .architectural:
            return "Памятник"
        case .historical:
            return "Историческое место"
        case .walk:
            return "Место для прогулок"

        }
    }
    let lat: Float
    let lon: Float
    let category: Category
    let sightDescription: String
    let photos: [String]
    let image: String
    
    enum Category: String, Codable {
        case architectural
        case historical
        case walk
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
        else { fatalError("load sights - failed") }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Sight].self, from: data)
        } catch { fatalError("decode sights - failed") }
    }
    
    var markerTintColor: UIColor  {
        switch category {
        case .architectural:
            return .red
        case .historical:
            return .blue
        case .walk:
            return .green
        }
    }
    
    var markerImage: UIImage {
        switch category {
        case .architectural:
            return #imageLiteral(resourceName: "architectural")
        case .historical:
            return #imageLiteral(resourceName: "historical")
        case .walk:
            return #imageLiteral(resourceName: "walk")
        }
    }
}

