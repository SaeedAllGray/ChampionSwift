//
//  TeamListModelView.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import SwiftUI

final class SearchTeamModelView: ObservableObject {
    
    //    @Published var searchQuery: String = ""
    @Published var loadingState: LoadingState = .notLoaded
    
    @Published var teamList = [Team]()
    
    
    
    func search(team name: String) {
        teamList.removeAll()
        self.loadingState = .loading
       
        let query = ["search": name]
        let requestInstance: Request = Request.instance()
        let request = requestInstance.url("teams", query)
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(request)
            guard let data = data else { return }

            let jsonDecoder = JSONDecoder()

            do {
                let teamsInfo = try jsonDecoder.decode(Response<Team>.self, from: data)
                DispatchQueue.main.async {
                    for result in teamsInfo.response {

                        self.teamList.append(result.result)
                        
                    }
                    
                    self.loadingState = .loaded
                }
                
            } catch let err {
                print(err)
            }

        }

        task.resume()
        
//        requestInstance.resumeTast(loadingState: &loadingState, request: request)
        
    }
}
