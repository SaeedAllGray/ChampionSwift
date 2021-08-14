//
//  Score.swift
//  ChampionSwift
//
//  Created by saeed on 8/14/21.
//

import Foundation

struct Sides<Type: Codable>: Codable {
    let home: Type
    let away: Type
    
    enum CodingKeys: String, CodingKey {
        case home
        case away
    }
}
