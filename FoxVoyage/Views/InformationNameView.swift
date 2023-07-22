//
//  InformationNameView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 22/07/23.
//

import SwiftUI

struct InformationNameView: View {
    @State var name: String = ""
    var body: some View {
        VStack{
            VStack{
                Text("Welcome aboard!")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("We're all set to begin, ")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("but first, what should ")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("we call you?")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                
            }
               
            TextField("Your name...", text: $name)
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)
         
           
            
            
            
         
            
          
           
            Spacer()
            
            Button{
                
            }
        label: {
            HStack{
                Text("Selanjurnya")
                    .font(.custom("SFProText-Regular", size: 17))
                    .foregroundColor(.white)
                Image(systemName: "arrow.up.forward")
                    .foregroundColor(.white)
            }
                .frame(maxWidth: 358, maxHeight: 64)
                .background(Color("Black200"))
                .cornerRadius(50)
              
        }
            
       
        }

    }
}

struct InformationNameView_Previews: PreviewProvider {
    static var previews: some View {
        InformationNameView()
    }
}
