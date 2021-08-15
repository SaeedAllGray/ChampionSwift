//
//  Fixture.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import Foundation

struct Fixture: Identifiable, Codable {
    var id: Int
    var referee: String?
    
    
//    var date: Date
//    var timestamp: Date
//    var timezone: TimeZone
    
    var venue: Venue?
    
    
    
    enum CodingKeys: CodingKey {
        case id
        case referee
        
//        case date
//        case timestamp
//        case timezone
        case venue
        
        
    }
   
}

extension Fixture {
    static var dataStr = """
    {
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
    }
    """
    
    static func moc() -> Fixture {
        let jsonDecoder = JSONDecoder()
        let data = Data(dataStr.utf8)
        let premireLeague = try! jsonDecoder.decode(Fixture.self, from: data)
        return premireLeague
    }
}
