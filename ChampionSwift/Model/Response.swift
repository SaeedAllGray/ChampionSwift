//
//  Response.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import Foundation



struct Response<Type: Codable>: Codable {
    var response: [Result<Type>]

    enum CodingKeys: CodingKey {
        case response
    }
    init(from decoder: Decoder) throws {
        
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try valueContainer.decode([Result<Type>].self, forKey: .response)
    }
}
