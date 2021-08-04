//
//  TeamInfoView.swift
//  ChampionSwift
//
//  Created by navid on 8/3/21.
//
import SwiftUI

struct TeamInfoView: View {
    @ObservedObject var teamPlayersModelView = TeamPlayersModelView()
    
    var team: Team
    
    var body: some View {
        
        VStack (alignment: .center){
            //                VStack{
            //                    Image.contents(of: team.logoUrl)
            //                    Text(team.name)
            //                        .foregroundColor(.white)
            //                        .frame(width: geo.size.width*0.8)
            //                        .font(.largeTitle)
            //                        .padding()
            //                }
            //                .frame(maxWidth: .infinity, maxHeight: geo.size.height/3)
            //                .background(Color(red: 14/255, green: 23/255, blue: 77/255))
            
            List {
                Section {
                    VStack{
                        Image.contents(of: team.logoUrl)
                        Text(team.name)
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width*0.8)
                            .font(.largeTitle)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/3)
                    
                }
                .listRowInsets(EdgeInsets())
                Section(header: Text("Recent Matches")) {
                    ResultCellView()
                    ResultCellView()
                }
                
                Section (header: Text("Standing")){
                    Text("Under development by Saeed")
                        .font(.headline)
                    
                }
                Section (header:Text("Players")) {
                    ScrollView(.horizontal) {
                        HStack( spacing: 10) {
                            ForEach(teamPlayersModelView.playerList) { player in
                                PlayerCellView(player: player)
                            }
                        }
                        .padding()
                        
                    }.onAppear(perform: {
                        teamPlayersModelView.setPlayers(of: team)
                    })
                    
                    .padding(.zero)
                    .frame(height: 200)
                }
                .listRowInsets(EdgeInsets())//removes padding from the listView's section item
                
            }
            .listStyle(InsetGroupedListStyle())
        }.navigationTitle(team.name)
        
        
    }
}

struct TeamInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInfoView(team: Team.moc())
    }
}
