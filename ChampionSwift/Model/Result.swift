//
//  Result.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import Foundation


struct Result: Codable {
    var result: Team
    

    enum TeamsKey: String, CodingKey {
        case result = "team"
    }

   
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: TeamsKey.self)
        self.result = try valueContainer.decode(Team.self, forKey: .result)
        
    }
}
