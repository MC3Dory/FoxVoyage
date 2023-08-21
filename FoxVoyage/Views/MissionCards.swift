//
//  MissionCards.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 23/07/23.
//

import SwiftUI

struct MissionCards: View {
    
    var body: some View {
        
        VStack {
            QuestCheckIn()
            
            MissionScrollView()

        }
    }
}

struct MissionCards_Previews: PreviewProvider {
    static var previews: some View {
        MissionCards()
    }
}

struct QuestCheckIn: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text ("Coastarina")
                    .font(.system(size: 29))
                    .padding(.leading, 20)
                    .padding(.trailing, 25)
                    .foregroundColor(Color.black)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Text ("Finish the quest to earn a FoxStamp.")
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                    .padding(.trailing, 25)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.gray)
                
                ZStack {
                    
                    Rectangle()
                        .frame(width: 150, height: 60)
                        .cornerRadius(999)
                        .foregroundColor(Color("Redish400"))
                        .padding(.leading, 15)
                    
                    HStack (spacing: 12) {
                        Text("Check In")
                            .font(.custom("SFProDisplay-Medium", size: 17))
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            Image ("stamp")
                .offset(x:30, y: 0)
        }
    }
}
