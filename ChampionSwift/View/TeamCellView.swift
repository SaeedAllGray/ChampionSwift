//
//  TeamCellView.swift
//  ChampionSwift
//
//  Created by navid on 7/29/21.
//

import SwiftUI

struct TeamCellView: View {
    var body: some View {
        HStack {
            Image("testicon").resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading ){
                Text("Machester").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Premiere Leage")
            }
        }
    }
}

struct TeamCellView_Previews: PreviewProvider {
    static var previews: some View {
        TeamCellView()
    }
}
