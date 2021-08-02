//
//  TeamInfoView.swift
//  ChampionSwift
//
//  Created by navid on 7/31/21.
//

import SwiftUI

struct TeamInfoView: View {
    @ObservedObject var teamInfoModelView = TeamInfoModelView()
    
    var team: Team
    
    var body: some View {
        
        VStack {
            if teamInfoModelView.loadingState == .loaded {
                List(teamInfoModelView.leagueList, id: \.id) { league in
                    LeagueCell(league: league)
                    
                }
                .listStyle(InsetGroupedListStyle())
            } else {
                
                Spacer()
                ProgressView()
                Spacer()
                
                
            }
        }
        .navigationBarTitle(Text(verbatim: team.name))
        .onAppear(perform: {
            teamInfoModelView.setLeagueList(of: team)
        })
    }
}

struct TeamInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInfoView(team: Team.moc())
    }
}
