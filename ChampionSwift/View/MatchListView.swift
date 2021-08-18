//
//  MatchListView.swift
//  ChampionSwift
//
//  Created by saeed on 8/18/21.
//

import SwiftUI

struct MatchListView: View {
    @ObservedObject var matchListModelView = MatchListModelView()
    
    var matchList = [Match.moc(),Match.moc(),Match.moc(),Match.moc(),Match.moc(),Match.moc(),Match.moc(),Match.moc()]
    
    var body: some View {
       
        VStack {
            List {
                
                ForEach(matchList, id: \.fixture.id) { match in
                    MatchRow(match: match)
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        
       
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView()
    }
}
