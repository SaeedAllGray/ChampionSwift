//
//  TeamCell.swift
//  ChampionSwift
//
//  Created by saeed on 7/29/21.
//

import SwiftUI

struct TeamRow: View {
//    @EnvironmentObject var favoriteTeams: FavoriteTeams
    
    var team: Team
   
    
    var body: some View {
        HStack {
            
            Image.contents(of:team.logoUrl )

            
            
                .resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading ){
                Text(team.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(team.country ?? "N/A")
            }
            Spacer()
//            Button(action: {
//                if favoriteTeams.contains(team) {
//                    favoriteTeams.remove(team)
//                } else {
//                    favoriteTeams.add(team)
//                }
//            }, label: {
//                Image(systemName: favoriteTeams.contains(team) ? "star.fill" : "star")
//            }).buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(team: Team.moc())
    }
}
