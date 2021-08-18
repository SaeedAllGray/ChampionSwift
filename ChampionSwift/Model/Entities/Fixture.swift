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
    
    
    var date: Date
    var timestamp: Date
//    var timezone: TimeZone
    
    var venue: Venue?
    
    
    
    enum CodingKeys: CodingKey {
        case id
        case referee
        
        case date
        case timestamp
//        case timezone
        case venue
        
        
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try valueContainer.decode(Int.self, forKey: .id)
        referee = try? valueContainer.decode(String.self, forKey: .referee)
        venue = try? valueContainer.decode(Venue.self, forKey: .venue)
        
        let dateFormatter = ISO8601DateFormatter()
        let dateString = try valueContainer.decode(String.self, forKey: .date)
        date = dateFormatter.date(from: dateString)!
        let timestamps = try valueContainer.decode(TimeInterval.self, forKey: .timestamp)
        let myTimeInterval = TimeInterval(timestamps)
        timestamp = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval)) as Date
        
         
        
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
            "elapsed": 90
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
