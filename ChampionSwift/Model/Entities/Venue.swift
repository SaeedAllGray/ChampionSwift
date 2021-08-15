//
//  Venue.swift
//  ChampionSwift
//
//  Created by saeed on 8/12/21.
//

import Foundation

struct Venue: Identifiable, Codable {
    var id: Int
    var name: String
    var city: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case city
    }
}
