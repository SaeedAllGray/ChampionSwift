//
//  Team.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//

import Foundation


struct Team: Codable, CustomStringConvertible, Identifiable{
    var description: String {
        return "\(name)"
    }
    
    let id: Int
    let name: String
    let country: String?
    let founded: Int?
    let national: Bool
    let logoUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case founded
        case national
        case logoUrl = "logo"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try valueContainer.decode(Int.self, forKey: .id)
        self.name = try valueContainer.decode(String.self, forKey: .name)
        self.country = try? valueContainer.decode(String.self, forKey: .country)
        self.founded = try? valueContainer.decode(Int.self, forKey: .founded)
        self.national = try valueContainer.decode(Bool.self, forKey: .national)
        self.logoUrl = try valueContainer.decode(URL.self, forKey: .logoUrl)
    }

}

extension Team {
    
    static var dataStr = """
    {
    "id":33,
    "name":"Manchester United",
    "country":"England",
    "founded":1878,
    "national":false,
    "logo":"https://media.api-sports.io/football/teams/33.png"
    }
    """
    
    static func moc() -> Team {
        let data = Data(dataStr.utf8)
        let jsonDecoder = JSONDecoder()
        let manutd = try! jsonDecoder.decode(Team.self, from: data)
        return manutd
    }
}
