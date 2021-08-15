//
//  PlayerListView.swift
//  ChampionSwift
//
//  Created by saeed on 8/15/21.
//

import SwiftUI

struct PlayerListView: View {
    @ObservedObject var teamPlayersViewModel = TeamPlayersModelView()
    var team: Team
    
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        
        ScrollView {
            if teamPlayersViewModel.loadingState == .loaded
            {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(teamPlayersViewModel.playerList) { player in
                        PlayerCellView(player: player)
                    }
                }
                .padding(.horizontal)
                
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
            }
        }
        
        .onAppear(perform: {
            teamPlayersViewModel.setPlayers(of: team)
        })
        
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView(team: Team.moc())
    }
}
