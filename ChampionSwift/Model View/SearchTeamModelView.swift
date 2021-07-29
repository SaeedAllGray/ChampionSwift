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
    
        self.loadingState = .loading
        teamList.removeAll()
        var url = URL(string: "https://v3.football.api-sports.io")!
        url.appendPathComponent("teams")
        let query = ["search": name]
        let baseurl = url.withQueries(query)!
        
        var request = URLRequest(url: baseurl ,timeoutInterval: Double.infinity)
        request.addValue("59bacee5d5b48ef6fa48a0e7df1be111", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        
        
        
        
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let teamsInfo = try jsonDecoder.decode(Response.self, from: data)
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
        
        
    }
}
