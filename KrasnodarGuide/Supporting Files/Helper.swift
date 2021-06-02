//
//  Helper.swift
//  KrasnodarGuide
//
//  Created by user on 28/05/2021.
//

import Foundation

enum ContentType {
    case sight
    case person
    case historicalEvent
    
    var tabBarItem: Int {
        switch self {
            
        case .sight:
            return TabBarMenu.Map.rawValue
        case .person:
            return TabBarMenu.Persons.rawValue
        case .historicalEvent:
            return TabBarMenu.HistoricalEvent.rawValue
        }
    }
}
