//
//  StandingRow.swift
//  ChampionSwift
//
//  Created by saeed on 8/3/21.
//

import SwiftUI

struct StandingRow: View {
    var standing: Standing
    var body: some View {
        HStack {
            
            ZStack {
                switch standing.status {
                case .promotion:
                    Color(.green).ignoresSafeArea()
                case .playoff:
                    Color(.orange).ignoresSafeArea()
                case .relegation:
                    Color(.red).ignoresSafeArea()
                default:
                    Color(.clear).ignoresSafeArea()
                }
                
            }
            .frame(width: 5, height: 30)
            
            
            Text("\(standing.rank)")
            Image.contents(of: standing.team.logoUrl)
                .resizable()
                .frame(width: 30, height: 30)
                
            Text(standing.team.name)
                
            Spacer()
            Text("\(standing.points)")
                
            
                
        }
       
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingRow(standing: Standing.moc())
    }
}
