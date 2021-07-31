//
//  TeamCell.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import SwiftUI

struct TeamCell: View {
    var team: Team
    
    
    var body: some View {
        HStack {
            
            Image.contents(of:team.logoUrl )

            
            
                .resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading ){
                Text(team.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(team.country ?? "N/A")
            }
        }
    }
}

struct TeamCell_Previews: PreviewProvider {
    static var previews: some View {
        TeamCell(team: Team.moc())
    }
}
