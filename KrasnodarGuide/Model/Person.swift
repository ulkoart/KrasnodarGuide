//
//  Person.swift
//  KrasnodarGuide
//
//  Created by user on 12.05.2021.
//

import Foundation

struct Person: Codable {
    let name: String
    let years: String
    let image: String
    let description: String
    let text: String
    let photos: [String]
}

extension Person {
    static func getPersons() -> [Person] {
        guard
            let url = Bundle.main.url(forResource: "persons", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { fatalError("load persons - failed") }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Person].self, from: data)
        } catch { fatalError("decode persons - failed") }
    }
}
