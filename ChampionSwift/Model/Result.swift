//
//  Result.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import Foundation


struct Result<Type: Codable>: Codable {
    var result: Type
    
    enum CodingKeys: String, CodingKey {
        var rawValue: String {
            get {
                return String(describing: Type.self).lowercased()
            }
        }
        
        case result
    }
     
   
    init(from decoder: Decoder) throws {
        
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try valueContainer.decode(Type.self, forKey: .result)
        
    }
    
}
