//
//  StandingRow.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import SwiftUI

struct StandingRow: View {
    var team: Team
    var body: some View {
        HStack {
            
//            ZStack {Color(.green).ignoresSafeArea()}
//                .frame(width: 5, height: 30)
            Text("1")
            Image.contents(of: team.logoUrl)
                .resizable()
                .frame(width: 30, height: 30)
                
            Text(team.name)
                
            Spacer()
            Text("0")
                
        }
       
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingRow(team: Team.moc())
    }
}
