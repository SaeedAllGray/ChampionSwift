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
            }.navigationBarTitle(Text("Search"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
