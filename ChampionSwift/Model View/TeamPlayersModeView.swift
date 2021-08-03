//
//  PersonModeView.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import SwiftUI

final class TeamPlayersModelView: ObservableObject {
    @Published var loadingState = LoadingState.notLoaded
    @Published var playerList = [Player]()
    
    func setPlayers(of team: Team) {
        self.loadingState = .loading
        playerList.removeAll()
        
        let query = ["season": "2020", "team": "\(team.id)"]
        let requestInstance: Request = Request.instance()
        let request = requestInstance.url("players", query)
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let teamsInfo = try jsonDecoder.decode(Response<Player>.self, from: data)
                DispatchQueue.main.async {
                    for result in teamsInfo.response {
                        
                        self.playerList.append(result.result)
                    }
                    self.loadingState = .loaded
                }
            } catch let err {
                print(err)
            }
            
        }
        
        task.resume()
        
    }
     
}

