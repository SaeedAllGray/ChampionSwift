//
//  MatchModelView.swift
//  ChampionSwift
//
//  Created by saeed on 8/18/21.
//

import SwiftUI

final class MatchListModelView: ObservableObject {
    @Published var matchList = [Match]()
    @Published var loadingState: LoadingState = .notLoaded
    
    
    let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: Date())
    
    
    func setMatches(of team: Team) {
        matchList.removeAll()
        loadingState = .loading
        
        let query = ["team": "\(team.id)", "from": "2020","to": "2020"]
        let requestInstance: Request = Request.instance()
        let request = requestInstance.url("standings", query)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let matchListInfo = try jsonDecoder.decode(Response<Match>.self, from: data)
                DispatchQueue.main.async {

//                    self.matchList = matchListInfo.response[0].result
                    print(self.matchList)
//
                
                    self.loadingState = .loaded
                }
            } catch let err {
                print(err)
            }
            
        }
        
        task.resume()
    }
}
