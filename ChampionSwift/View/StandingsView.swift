//
//  MatchInfoView.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import SwiftUI

struct StandingsView: View {
    @ObservedObject var standingsModelView = StandingsModelView()
    var league: League
    var body: some View {
        VStack {
            
            HStack{
                Image.contents(of: league.logoUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .padding()

            }
            if standingsModelView.loadingState == .loaded {
            List {
                ForEach(standingsModelView.standings, id: \.self) { standings in
                    Section {
                        ForEach(standings) { standing in
                            StandingRow(standing: standing)
                        }
                    }
                }
            
            
            }
                .listStyle(PlainListStyle())
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            
//            .listStyle(GroupedListStyle())
        }.onAppear(perform: {
            standingsModelView.setStandings(league: league)
        })
        
    
        
        
        
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StandingsView(league: League.moc())
            
        }
    }
}
