//
//  Standing.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import Foundation

struct Standing: Codable, Identifiable, Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
    }
    static func == (lhs: Standing, rhs: Standing) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var rank: Int
    var team: Team
    var points: Int
    var goalsDiff: Int
    var form: String
    var description: String?
    
     var status: StandingStatus {
        guard let status = description else { return .none}
        
        if status.contains("Promotion") {
            if rank < 5 {
                return .promotion
            }
            return .playoff
        }
        return.relegation
    }
    
    enum CodingKeys: String, CodingKey {
        case rank
        case team
        case points
        case goalsDiff
        case form
        case description
    }
    
    
}

extension Standing {
    static var dataStr = """
        {
        "rank": 1,
        
        "points": 86,
        "goalsDiff": 51,
        "team": {
                    "id": 50,
                    "name": "Manchester City",
                    "logo": "https://media.api-sports.io/football/teams/50.png"
                },
        "form": "wdwdwd",
        "description": "Relegation"
        }
        """
    
    static func moc() -> Standing {
        let data = Data(dataStr.utf8)
        let jsonDecoder = JSONDecoder()
        let mancity = try! jsonDecoder.decode(Standing.self, from: data)
        return mancity
    }
   
}
