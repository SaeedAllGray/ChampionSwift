//
//  SearchView.swift
//  ChampionSwift
//
//  Created by navid on 7/28/21.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView{
            Form {
                
                Section {
                    Text("Hello World")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Search"))
        }.onAppear(perform: {
            print(Team.moc())
        })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
