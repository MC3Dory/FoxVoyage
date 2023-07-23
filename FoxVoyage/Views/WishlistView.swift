//
//  WishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        VStack{
            
            Text("ada 5 rencana trip untuk dilakukan")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .foregroundColor(Color("Black900"))
                .padding(.trailing, 100)
            
            
          
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Redish100"))
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
