//
//  SearchView.swift
//  ChampionSwift
//
//  Created by navid on 7/28/21.
//
import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    
    @ObservedObject var teamListModelView = SearchTeamModelView()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Enter team name", text: $searchTerm, onCommit:  {
                        teamListModelView.search(team: searchTerm)
                    })
                    
                }
                .padding(8).background(Color(.systemGray5))
                .cornerRadius(10).padding(.horizontal, 15)
                
                
                if teamListModelView.loadingState == .loaded {
                    List {
                        
                        
                        
                        
                        ForEach(teamListModelView.teamList, id: \.id) { team in
                            TeamCell(team: team)
                        }
                        
                        
                        
                    }
                    
                    .listStyle(InsetListStyle())
                } else if teamListModelView.loadingState == .notLoaded {
                    Text("Hello navid")
                } else {
                    
                    Spacer()
                    ProgressView()
                    Spacer()
                           
                    
                }
                Spacer()
                
                
            }.navigationBarTitle(Text(verbatim: "Search"))
            
        }
        
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
