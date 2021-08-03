//
//  TeamInfoView.swift
//  ChampionSwift
//
//  Created by navid on 7/31/21.
//

import SwiftUI

struct TeamInfoView: View {
    @ObservedObject var teamInfoModelView = TeamInfoModelView()
    
    var team: Team
    
    var body: some View {
        
        VStack {

            Image.contents(of: team.logoUrl).padding().background(Color(.systemGray4)).clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                HStack {
                    Text("Founded in")
                    if let founded = team.founded {
                        Text(String(founded))
                    } else {
                        Text("N/A")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(10)
                
                if let country = team.country {
                    Text("\(country)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .padding()
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
