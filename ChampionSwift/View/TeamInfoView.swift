//
//  TeamInfoView.swift
//  ChampionSwift
//
//  Created by navid on 8/3/21.
//
import SwiftUI

struct TeamInfoView: View {
    @ObservedObject var teamPlayersModelView = TeamPlayersModelView()
    
    var team: Team
    
    var body: some View {
        
        ZStack{
            Color(.secondarySystemFill)
            TabView {
                StandingsView(league: League.moc())
                VStack{
                    PlayerListView(team: team)
                    
                }
                .cornerRadius(20)
                .padding()
                VStack{Color.blue}.padding()
            }
            .tabViewStyle(PageTabViewStyle())
            
        }

    }
    
}



struct TeamInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInfoView(team: Team.moc())
    }
}
