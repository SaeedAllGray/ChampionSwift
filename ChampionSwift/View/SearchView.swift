//
//  SearchView.swift
//  ChampionSwift
//
//  Created by navid on 7/28/21.
//
import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    @State var isSearching = false
    @ObservedObject var favoriteTeams = FavoriteTeams()
    @ObservedObject var teamListModelView = SearchTeamModelView()
     
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Enter team name", text: $searchTerm, onCommit:  {
                            teamListModelView.search(team: searchTerm)
                        })
                        
                    }.onTapGesture {
                        isSearching = true
                    }
                    .padding(8)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchTerm = ""
                            //dismisses the keyboard
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                
                        })
                        
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }.padding(.bottom, 4)
                
                
                
                if teamListModelView.loadingState == .loaded {
                    if teamListModelView.teamList.isEmpty {
                        Text("No teams found for \"\(searchTerm)\"").frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        List(teamListModelView.teamList, id: \.id) { team in
                            
                            NavigationLink(destination: TeamInfoView(team: team)){
                                TeamRow(team: team)
                            }
                                    
                               
                        }
                        .listStyle(InsetListStyle())
                    }
                } else if teamListModelView.loadingState == .notLoaded {
                    Text("Hello navid")
                } else {
                    
                    
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    
                    
                }
                Spacer()
                
                
            }
            .navigationBarTitle(Text(verbatim: "Search"))
            .environmentObject(favoriteTeams)
            
        }
        
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
