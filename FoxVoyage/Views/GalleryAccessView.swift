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
//            VStack{
            HStack{
                    Text("Enjoy")
                        .foregroundColor(Color("Black200"))
                        .font(.custom("SFProDisplay-Regular", size: 34))
                    Text("the full experience,")
                        .font(.custom("SFProDisplay-Regular", size: 34))
                }

                .frame(maxWidth: 355, alignment: .leading)
                HStack{
//                    Text("")
//                        .font(.custom("SFProDisplay-Regular", size: 34))
                    Text("grant")
                        .foregroundColor(Color("Black200"))
                        .font(.custom("SFProDisplay-Regular", size: 34))
                    Text("permission")
                        .font(.custom("SFProDisplay-Regular", size: 34))
                    Text("to")
                        .foregroundColor(Color("Black200"))
                        .font(.custom("SFProDisplay-Regular", size: 34))
                }
                .frame(maxWidth: 355, alignment: .leading)
                HStack{
                    Text("access")
                        .font(.custom("SFProDisplay-Regular", size: 34))
                    Text("gallery")
                        .font(.custom("SFProDisplay-Regular", size: 34))
                    
                    
                }
                .frame(maxWidth: 355, alignment: .leading)
//            }
            
    
            
            Image("galleryAccess")
                .padding(.top,15)
            Text("Let's explore your gallery together! Allow access to preserve your travel memories beautifully")
                .font(.custom("SFProText-Regular", size: 17))
                .frame(maxWidth: 360, alignment: .leading)
                .padding(.top, 40)
            
            Spacer()
            Button{
                
            }
        label: {
            Text("Give Access")
                .foregroundColor(.white)
                .frame(maxWidth: 358, maxHeight: 64)
                .background(Color("Redish400"))
                .cornerRadius(999)
                
               
        }
        }
    }
}

struct GalleryAccessView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryAccessView()
    }
}
