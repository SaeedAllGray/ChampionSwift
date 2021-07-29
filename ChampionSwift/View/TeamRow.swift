//
//  TeamCell.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//

import SwiftUI

struct TeamRow: View {
    var team = getManUtd()!
    var body: some View {
        HStack {
            RemoteImage(url: "\(team.logoUrl)")
            Text(team.name)
            
        }
    }
}

struct TeamCell_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow()
    }
}
