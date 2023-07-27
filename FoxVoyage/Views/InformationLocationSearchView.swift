//
//  InformationLocationSearchView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 26/07/23.
//

import SwiftUI

struct InformationLocationSearchView: View {
    @State var searchText = ""
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    
                
                TextField("home adress", text: $searchText)
                    .font(.custom("SFProDisplay-Regular", size: 17))
                    .padding(.trailing, 12.0)
                    .frame(maxWidth: 250, alignment: .leading)
                    .foregroundColor(Color("Redish400"))
                
                Image(systemName: "multiply")
                    .foregroundColor(.gray)
                
               
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 0)
            .frame(width: 358, height: 56, alignment: .leading)
            .cornerRadius(999)
            .overlay(
            RoundedRectangle(cornerRadius: 999)
            .inset(by: 0.5)
            .stroke(Color("Redish400"), lineWidth: 1))
            .padding(.bottom)
            .padding(.top)
            
            HStack(alignment: .center, spacing: 16){
                ZStack{
                    Image("ellipse")
                    Image(systemName: "square.dashed")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
               
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Rusunawa BPJS Kabil")
                        .font(Font.custom("SF Pro Text", size: 17)
                          .weight(.medium))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                    Text("Batam")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                }
            }
            .padding(12)
            .frame(width: 358, alignment: .leading)
            .background(Color(red: 1, green: 0.98, blue: 0.95))
            .cornerRadius(30)
            
            HStack(alignment: .center, spacing: 16){
                ZStack{
                    Image("ellipse")
                    Image(systemName: "square.dashed")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
               
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Batu Aji")
                        .font(Font.custom("SF Pro Text", size: 17)
                          .weight(.medium))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                    Text("Batam")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                }
            }
            .padding(12)
            .frame(width: 358, alignment: .leading)
            .background(Color(red: 1, green: 0.98, blue: 0.95))
            .cornerRadius(30)
            
            HStack(alignment: .center, spacing: 16){
                ZStack{
                    Image("ellipse")
                    Image(systemName: "square.dashed")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
               
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Nongsa")
                        .font(Font.custom("SF Pro Text", size: 17)
                          .weight(.medium))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                    Text("Batam")
                        .font(Font.custom("SF Pro Text", size: 15))
                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                }
            }
            .padding(12)
            .frame(width: 358, alignment: .leading)
            .background(Color(red: 1, green: 0.98, blue: 0.95))
            .cornerRadius(30)
            
            Spacer()
        }
     
    }
}

struct InformationLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        InformationLocationSearchView()
    }
}
