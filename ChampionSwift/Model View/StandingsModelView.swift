//
//  StandingsModelView.swift
//  ChampionSwift
//
//  Created by saeed on 8/4/21.
//

import SwiftUI

final class StandingsModelView: ObservableObject {
    @Published var standings = [[Standing]]()
    @Published var loadingState: LoadingState = .notLoaded
    
    func setStandings(league: League) {
        standings.removeAll()
        loadingState = .loading
        
        let query = ["league": "\(league.id)", "season": "2020"]
        let requestInstance: Request = Request.instance()
        let request = requestInstance.url("standings", query)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let stanfInfo = try jsonDecoder.decode(Response<League>.self, from: data)
                DispatchQueue.main.async {
//                    print(String(data: data, encoding: String.Encoding.utf8))
                    
                    
//                    let leagueStandings = stanfInfo.response[0].result.standings ?? [[]]
                    self.standings = stanfInfo.response[0].result.standings ?? [[Standing]]()
                    print(self.standings)
//                    print(leagueStandings)
//                    for standings in leagueStandings {
//                        self.standings.append(standings)
//
//                    print(standing)
//                    }
                
                    self.loadingState = .loaded
                }
            } catch let err {
                print(err)
            }
            
        }
        
        task.resume()
    }
    
}

extension Array where Element : Collection {
    subscript(column column : Element.Index) -> [ Element.Iterator.Element ] {
        return map { $0[ column ] }
    }
}
