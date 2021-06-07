//
//  TabBarMenuItems.swift
//  KrasnodarGuide
//
//  Created by user on 25/05/2021.
//

import Foundation

enum TabBarMenu: Int {
    case Main
    case Map
    case Persons
    case HistoricalEvent
    
    var viewControlerIdentifier: String {
        
        switch self {
        case .Main:
            return ""
        case .Map:
            return MapVC.identifier
        
        case .Persons:
            return PersonVC.identifier
        
        case .HistoricalEvent:
            return HistoricalEventsVC.identifier
  
        }
        
    }
}
