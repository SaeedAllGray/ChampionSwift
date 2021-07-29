//
//  SearchView.swift
//  ChampionSwift
//
//  Created by navid on 7/28/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Enter team name", text: $searchTerm)
                    
                }.padding(8).background(Color(.systemGray5))
                .cornerRadius(10).padding(.horizontal, 15)
                List {
                    
                    
                    TeamCellView()
                    TeamCellView()
                    
                }.listStyle(InsetListStyle())
                
                .navigationBarTitle(Text("Search"))
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
