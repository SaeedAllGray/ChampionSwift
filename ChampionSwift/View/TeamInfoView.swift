//
//  TeamInfoView.swift
//  ChampionSwift
//
//  Created by navid on 7/31/21.
//

import SwiftUI

struct TeamInfoView: View {
    var team: Team
    var body: some View {
        
            VStack {
                Image.contents(of: team.logoUrl)
            }
            .navigationTitle(team.name)
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "star")
            }))
    }
}

struct TeamInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInfoView(team: Team.moc())
    }
}
