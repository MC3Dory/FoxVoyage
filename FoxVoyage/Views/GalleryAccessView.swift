//
//  GalleryAccessView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 20/07/23.
//

import SwiftUI

struct GalleryAccessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Immerse yourself")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("in the")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
                }
                .frame(maxWidth: 355, alignment: .leading)
                .padding(.top)
            
          
            Text("complete experience")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)
                
            HStack{
                Text("allow acces")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("to the")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
                }
                .frame(maxWidth: 355, alignment: .leading)
            
            Text("gallery")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)

            
    
            
            Image("galleryAccess")
                .padding(.top,15)
            Text("Let's explore your gallery together! Allow access to preserve your travel memories beautifully")
                .font(.custom("SFProText-Regular", size: 17))
                .frame(maxWidth: 360, alignment: .leading)
                .padding(.top, 20)
            
           Spacer()
            Button{
                
            }
        label: {
            Text("Give Access")
                .foregroundColor(.white)
                .frame(width: 358, height: 64, alignment: .center)
                .background(Color("Redish400"))
                .cornerRadius(999)
                .padding(.top,2)
                
               
        }
        }
        
    }
}

struct GalleryAccessView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryAccessView()
    }
}
