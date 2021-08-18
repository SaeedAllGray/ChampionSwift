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
        
        HStack {
           
            Image.contents(of: match.homeTeam.logoUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding()
                
            
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
                .scaledToFit()
                .frame(height: 40)
                .padding()
            
        }.background(Color.blue)
//        .frame(height: 50)
    
//        .background(Color(.blue))
        
        
    }
    
}

struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchRow(match: Match.moc())
    }
}
