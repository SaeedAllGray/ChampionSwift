//
//  PlayerCellView.swift
//  ChampionSwift
//
//  Created by navid on 8/3/21.
//
import SwiftUI

struct PlayerCellView: View {
    var player: Player
    var body: some View {
        VStack {
            Image.contents(of: player.photoUrl)
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .scaledToFit()
                .padding(10)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2))
            
            Text(player.name)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }.frame(width: 100, height: 140)
    }
}

struct PlayerCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCellView(player: Player.moc())
    }
}
