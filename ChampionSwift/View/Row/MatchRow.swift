//
//  FixtureRow.swift
//  ChampionSwift
//
//  Created by saeed on 8/14/21.
//

import SwiftUI

struct MatchRow: View {
    var match: Match
    var body: some View {
        VStack {
            HStack {
                Image.contents(of: match.homeTeam.logoUrl)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                
                HStack {
                    Text("\(match.goals!.home)")
                    Text("-")
                    Text("\(match.goals!.away)")
                    
                  
                      
                    
                }
                
                
                .frame(width: 60,height: 20, alignment: .center)
//                .background(Color.blue)
//                .clipShape(Capsule())

                
                
            
                .padding()
                
                Image.contents(of: match.awayTeam.logoUrl)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                //                .padding()
                
            }
            .frame(height: 50)
            
        }
    }
}

struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchRow(match: Match.moc())
    }
}
