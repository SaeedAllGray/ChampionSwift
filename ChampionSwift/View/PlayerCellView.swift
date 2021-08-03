//
//  PlayerCellView.swift
//  ChampionSwift
//
//  Created by navid on 8/3/21.
//

import SwiftUI

struct PlayerCellView: View {
    var body: some View {
        VStack {
            Image.contents(of: Team.moc().logoUrl)
                .resizable()
                .scaledToFit()
                .padding(10)
                .background(Color(red: 14/255, green: 23/255, blue: 77/255))
                .clipShape(Circle())
                
            Text("Marcello Jr. Locako")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }.frame(maxWidth: 100, maxHeight: 140)
    }
}

struct PlayerCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCellView()
    }
}
