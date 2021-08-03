//
//  MatchInfoView.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import SwiftUI

struct StandingsView: View {
    var teamList: [Team] = [Team.moc(),Team.moc(),Team.moc(),Team.moc(),Team.moc()]
    var league: League
    var body: some View {
        VStack {
            
            HStack{
                Image.contents(of: league.logoUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .padding()
                
//                Text(league.name)
                
            }
            
            
            
            
            List(teamList) { team in
                StandingRow(team: team)
                  
                   
                    
            
            }
            
//            .listStyle(PlainListStyle())
        }
        
    
        
        
        
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StandingsView(league: League.moc())
            
        }
    }
}
