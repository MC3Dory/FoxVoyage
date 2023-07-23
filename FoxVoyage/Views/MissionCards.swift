//
//  MissionCards.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 23/07/23.
//

import SwiftUI

struct MissionCards: View {
    var orange = 0xffC5593A
    var violet = 0xff292D5A
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text ("Fox Quests")
                    .font(.system(size: 40))
                    .foregroundColor(Color(hex: orange))
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                
                ScrollView {
                    VStack {
                        ForEach(0..<20) {
                            mission in
                            ZStack {
                                Color(hex: violet)
                                    .frame(width: 350, height: 200, alignment: .center)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                
                                Circle ()
                                    .frame(width: 115)
                                    .foregroundColor(Color.gray)
                                    .opacity(0.6)
                                
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    
                                HStack{
                                    Spacer()
                                    
                                    ZStack {
                                        Image ("sticker")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 180, height: 180)
                                        
                                        Image ("Fox")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150)
                                        
                                    } .padding(.trailing, 10)
                        
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MissionCards_Previews: PreviewProvider {
    static var previews: some View {
        MissionCards()
    }
}
