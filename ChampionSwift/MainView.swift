//
//  ContentView.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("search", systemImage: "magnifyingglass")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
