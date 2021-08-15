//
//  Match.swift
//  ChampionSwift
//
//  Created by saeed on 8/14/21.
//

import Foundation

struct Match: Codable {
    var fixture: Fixture
    var league: League
    var teams: Sides<Team>
    var goals: Sides<Int>?
    
    var homeTeam: Team {
        return teams.home
    }
    var awayTeam: Team {
        return teams.away
    }
    
    enum CodingKeys: CodingKey {
        case fixture
        case league
        case goals
        case teams
    }
}

extension Match {
    static var dataStr = """
    {
        "fixture": {
            "id": 710561,
            "referee": "Paul Tierney, England",
            "timezone": "UTC",
            "date": "2021-08-14T11:30:00+00:00",
            "timestamp": 1628940600,
            "periods": {
                "first": 1628940600,
                "second": 1628944200
            },
            "venue": {
                "id": 556,
                "name": "Old Trafford",
                "city": "Manchester"
            },
            "status": {
                "long": "Match Finished",
                "short": "FT",
                "": 90
            }
        },
        "league": {
            "id": 39,
            "name": "Premier League",
            "country": "England",
            "logo": "https://media.api-sports.io/football/leagues/39.png",
            "flag": "https://media.api-sports.io/flags/gb.svg",
            "season": 2021,
            "round": "Regular Season - 1"
        },
        "teams": {
            "home": {
                "id": 33,
                "name": "Manchester United",
                "logo": "https://media.api-sports.io/football/teams/33.png",
                "winner": true
            },
            "away": {
                "id": 63,
                "name": "Leeds",
                "logo": "https://media.api-sports.io/football/teams/63.png",
                "winner": false
            }
        },
        "goals": {
            "home": 5,
            "away": 1
        },
    
    }

    """
    
    static func moc() -> Match {
        let jsonDecoder = JSONDecoder()
        let data = Data(dataStr.utf8)
        let manutdVSLeeds = try! jsonDecoder.decode(Match.self, from: data)
        return manutdVSLeeds
    }
}
