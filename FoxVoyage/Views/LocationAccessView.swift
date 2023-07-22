//
//  locAccess.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 21/07/23.
//

import SwiftUI

struct locationAccessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Discover")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("premier")
                    .font(.custom("SFProDisplay-Regular", size: 34))
               
            }
            .frame(maxWidth: 355, alignment: .leading)
            HStack{
                Text("navigation")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("authorize")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
//                Text("permission")
//                    .font(.custom("SFProDisplay-Regular", size: 34))
//                Text("untuk")
//                    .foregroundColor(Color("Black200"))
//                    .font(.custom("SFProDisplay-Regular", size: 34))
            }
            .frame(maxWidth: 355, alignment: .leading)
            HStack{
                Text("location")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                Text("access")
                    .font(.custom("SFProDisplay-Regular", size: 34))
            }
            .frame(maxWidth: 355, alignment: .leading)
            
            
            
            Image("locAccess")
                .padding(.top, 30.0)
            
          
            Text("Embrace our company on your voyage, as we unveil wonders around, granting access to locations abound. ")
                .font(.custom("SFProText-Regular", size: 17))
                .frame(maxWidth: 355, alignment: .leading)
                .padding(.top)
            
            Spacer()
            
            Button{
                
            }
        label: {
            Text("Give Access")
                .foregroundColor(.white)
                .frame(maxWidth: 358, maxHeight: 64)
                .background(Color("Redish400"))
                .cornerRadius(50)
              
        }
            
       
        }
    }
}

struct locAccess_Previews: PreviewProvider {
    static var previews: some View {
        locationAccessView()
    }
}
