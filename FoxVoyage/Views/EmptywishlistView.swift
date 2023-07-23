//
//  EmptywishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct EmptywishlistView: View {
    var body: some View {
        VStack{
            
            //user
            Text("Hi, john")
                .font(.custom("SFProDisplay-Regular", size: 20))
                .foregroundColor(Color("Black600"))
                .padding(.trailing, 300)
            
            Text("ada 0 rencana trip untuk dilakukan")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .foregroundColor(Color("Black900"))
                .padding(.trailing, 100)
            
            
            //imagestate
            Image("emptystate")
                .frame(width: 239, height: 190)
                .padding(.bottom, 32)
                .padding(.top, 128)
            Text("Wishlist menanti cerita seru")
                .font(.custom("SFProText-Regular", size: 17))
                .foregroundColor(Color("Black600"))
            Text("Rencanakan petualangan selanjutnya")
                .font(.custom("SFProText-Regular", size: 17))
                .foregroundColor(Color("Black600"))
            
            //button plus
            Button(action: {
                
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .frame(width: 64, height: 64)
            .background(Color("Redish400"))
            .clipShape(Circle())
            .offset(x: 130, y: -540)
            
            Spacer()
            
            //tabview
            ZStack{
                Rectangle()
                    .frame(width: 359, height: 72)
                    .cornerRadius(999)
                    .foregroundColor(.white)
                
                HStack (spacing: 62){
                    ZStack{
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color("Redish400"))
                        
                        Image(systemName: "map.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Redish100"))
    }
}

struct EmptywishlistView_Previews: PreviewProvider {
    static var previews: some View {
        EmptywishlistView()
    }
}
