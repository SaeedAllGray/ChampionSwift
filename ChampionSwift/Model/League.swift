//
//  League.swift
//  ChampionSwift
//
//  Created by saeed on 8/1/21.
//

import Foundation


struct League: Codable, CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
    
    let id: Int
    let name: String
    let type: String
    let logo: URL
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case type
        case logo
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try valueContainer.decode(Int.self, forKey: .id)
        self.logo = try valueContainer.decode(URL.self, forKey: .logo)
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
        let data = Data(dataStr.utf8)
        let premireLeague = try! jsonDecoder.decode(League.self, from: data)
        return premireLeague
    }
}
