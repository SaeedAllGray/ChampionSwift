//
//  Request.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import Foundation

class Request {
    
    typealias PathQueryRequest = (String,[String: String]) -> URLRequest
   
    lazy var url: (String,[String: String]) -> URLRequest = { (path, query) in
        
        var myURL = URL(string: "https://v3.football.api-sports.io")!
        myURL.appendPathComponent(path)
        myURL = myURL.withQueries(query)!
        
        
        var request = URLRequest(url: myURL ,timeoutInterval: Double.infinity)
        request.addValue("59bacee5d5b48ef6fa48a0e7df1be111", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"
        
        return request
    }
    
    static var instance = {
        return Request()
    }
    
    private init() {}
    
    func resumeTast<Type: Codable>(loadingState: inout LoadingState ,request: URLRequest) -> [Type] {
        var typeList = [Type]()
        loadingState = .loading
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let itemInfo = try jsonDecoder.decode(Response<Type>.self, from: data)
                DispatchQueue.main.async {
                    for result in itemInfo.response {
                        
                        typeList.append(result.result)
                    }
                    
                }
            } catch let err {
                print(err)
            }
            
        }.resume()
        loadingState = .loaded
        return typeList
    }
}
