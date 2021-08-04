//
//  ResultCallView.swift
//  ChampionSwift
//
//  Created by navid on 8/3/21.
//
import SwiftUI

struct ResultCellView: View {
    var body: some View {
        
        HStack (alignment: .center){
            VStack(alignment: .center) {
                Image.contents(of: Team.moc().logoUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/4)
                
                Text(Team.moc().name)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    
            }
            VStack {
                
                HStack {
                    Text("4")
                    Text("-")
                    Text("4")
                }
                .font(.title)
                
                
                
                Text("LIVE")
                    
                    .font(.system(size: 12))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(3)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.blue, lineWidth: 1.5)
                    )
            }
            VStack {
                Image.contents(of: Team.moc().logoUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/4)
                    
                Text(Team.moc().name)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    
            }
        }
//        .background(Color(.red))
//        .padding(.zero)
        .frame(maxWidth: .infinity, maxHeight: 100)
        
    }
}

struct ResultCellView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCellView()
    }
}
