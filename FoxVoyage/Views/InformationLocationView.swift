//
//  InformationLocationView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 23/07/23.
//

import SwiftUI

struct InformationLocationView: View {
    @State var searchText = ""
    
    var body: some View {
        VStack{
            VStack{
                Text("Hi [user’s name],")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("where do you reside?")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
               
            }
            
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding()
                    
                    TextField("home adress", text: $searchText)
                        .font(.custom("SFProDisplay-Regular", size: 17))
                        .padding(.trailing, 12.0)
                        .frame(maxWidth: 250, alignment: .leading)
                     
                                            }
                .frame(width: 358, height: 56, alignment: .leading)
                .padding(5)

                .border(Color.gray, width: 1)
                .cornerRadius(99)
             
           
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
                .background(Color("Redish400"))
                .cornerRadius(50)
              
        }
       
       
        }

    }
}

struct InformationLocationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationLocationView()
    }
}
