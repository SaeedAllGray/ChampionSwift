//
//  LegaueCell.swift
//  ChampionSwift
//
//  Created by saeed on 8/2/21.
//

import SwiftUI

struct LeagueCell: View {
    var league: League
    
    var body: some View {
        HStack {
            Image.contents(of: league.logo)
                .resizable().scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                
            Text(league.name)
                .font(.system(size: 20))
                .padding()
        
                                    
        }.padding()
        
    }
}

struct LegaueCell_Previews: PreviewProvider {
    static var previews: some View {
        LeagueCell(league: League.moc())
    }
}
