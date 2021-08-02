//
//  ContentView.swift
//  ChampionSwift
//
//  Created by saeed on 7/28/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView() {
            SearchView()
                .tag(0)
                .tabItem {
                    Label("search", systemImage: "magnifyingglass")
                }
            Text("test")
                .tag(1)
                .tabItem {
                    Label("other", systemImage: "hammer")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
