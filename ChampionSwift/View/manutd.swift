//
//  manutd.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//

import Foundation

let jsonDecoder = JSONDecoder()
var dataStr = """
{
"id":33,
"name":"Manchester United",
"country":"England",
"founded":1878,
"national":false,
"logo":"https://media.api-sports.io/football/teams/33.png"
}
"""
var data = Data(dataStr.utf8)

func getManUtd() -> Team? {
    do {
        let manutd = try jsonDecoder.decode(Team.self, from: data)
        return manutd
    
    } catch let error {
        print(error)
    }
    return nil
}

