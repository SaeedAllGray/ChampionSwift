//
//  League.swift
//  ChampionSwift
//
//  Created by saeed on 8/1/21.
//

import Foundation


struct League: Codable, CustomStringConvertible, Identifiable {
    var description: String {
        return "\(name)"
    }
    
    let id: Int
    let name: String
    let type: String
    let logoUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case logoUrl = "logo"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try valueContainer.decode(Int.self, forKey: .id)
        self.logoUrl = try valueContainer.decode(URL.self, forKey: .logoUrl)
        self.name = try valueContainer.decode(String.self, forKey: .name)
        self.type = try valueContainer.decode(String.self, forKey: .type)
    }
}

extension League {
    static var dataStr = """
    {
    "id": 39,
    "name": "Premier League",
    "type": "League",
    "logo": "https://media.api-sports.io/football/leagues/39.png"
    }
    """
    
    static func moc() -> League {
        let jsonDecoder = JSONDecoder()
        let data = Data(dataStr.utf8)
        let premireLeague = try! jsonDecoder.decode(League.self, from: data)
        return premireLeague
    }
}
