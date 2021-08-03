//
//  Person.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import Foundation

struct Player: Codable, Identifiable {
    var id: Int
    var name: String
    var firstname: String
    var lastname: String
    var photoUrl: URL
    var nationality: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstname
        case lastname
        case photoUrl = "photo"
        case nationality
    }
    
}


extension Player {
    static var dataStr =  """
    {
    "id": 891,
    "name": "L. Shaw",
    "firstname": "Luke",
    "lastname": "Shaw",
    "age": 26,
    "birth": {
    "date": "1995-07-12",
    "place": "Kingston upon Thames",
    "country": "England"
    },
    "nationality": "England",
    "height": "185 cm",
    "weight": "75 kg",
    "injured": false,
    "photo": "https://media.api-sports.io/football/players/891.png"
    }
    """
    
    static func moc() -> Player {
        let data = Data(dataStr.utf8)
        let jsonDecoder = JSONDecoder()
        let lukeShaw = try! jsonDecoder.decode(Player.self, from: data)
        return lukeShaw
    }
}
