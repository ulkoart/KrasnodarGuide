//
//  HistoricalEvent.swift
//  KrasnodarGuide
//
//  Created by user on 15.05.2021.
//

import Foundation

struct HistoricalEvent: Codable {
    let title: String
    let shortTitle: String
    let dateString: String
    let image: String
    let description: String
    let photos: [String]
}

extension HistoricalEvent {
    static func getHistoricalEvents() -> [HistoricalEvent] {
        guard
            let url = Bundle.main.url(forResource: "historicalEvents", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { fatalError("load historicalEvents - failed") }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([HistoricalEvent].self, from: data)
        } catch { fatalError("decode HistoricalEvent - failed") }
    }
}
