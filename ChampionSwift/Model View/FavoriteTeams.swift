//
//  FavoriteTeams.swift
//  ChampionSwift
//
//  Created by navid on 7/31/21.
//

import SwiftUI

class FavoriteTeams: ObservableObject {
    private var teams: Set<Int>
    private let defaults = UserDefaults.standard
    private let saveKey = "favoriteTeams"
    init() {
//        teams = defaults.object(forKey: "favoriteTeams") as? Set<Int> ?? []
        teams = []
    }
    
    func contains(_ team: Team) -> Bool {
        teams.contains(team.id)
    }
    
    func add(_ team: Team) {
       objectWillChange.send()
       teams.insert(team.id)
       save()
   }
    
    func remove(_ team: Team) {
        objectWillChange.send()
        teams.remove(team.id)
        save()
    }

    func save() {
//        defaults.set(teams, forKey: "favoriteTeams")
    }
    
}
