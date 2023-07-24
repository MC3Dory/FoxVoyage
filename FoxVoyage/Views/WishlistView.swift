//
//  WishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct WishlistView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack{
                Text("Buat momen \nterbaik di \ntempat terbaik")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .foregroundColor(Color("Black900"))
                    .padding(.leading, 16)
                
                Image("camera")
                    .offset(x: 225, y:10)
            }

            
            ZStack {
                RoundedRectangle(cornerRadius: 999)
                    .foregroundColor(.clear)
                    .frame(width: 358, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 999)
                            .stroke(Color("Redish400"), lineWidth: 1)
                    )
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("Black400"))
                        .padding(.leading, 40)
                    
                    TextField("Cari di", text: $searchText)
                        .font(.custom("SFProText-Regular", size: 17))
                        .foregroundColor(.white)
                        .overlay(
                            Text("Kota Batam")
                                .font(.custom("SFProText-Regular", size: 17))
                                .foregroundColor(Color("Black600"))
                                .padding(.leading, -105)
                        )
                    
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                        }
                    }
                }
            }.padding(.top, 30)
                .padding(.bottom, 24)
            
            
            //RecomendCardView
            RecomendCardView()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Redish100"))
        .padding(.top, -200)
    }
}

struct RecomendCardView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 358, height: 250)
                .cornerRadius(30)
                .foregroundColor(Color("Red100"))
            
            VStack{
                ZStack{
                    //image
                    HStack (spacing:0){
                        Image("place1")
                        Image("place2")
                    }
                    //button
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 24))
                            .foregroundColor(Color("Black900"))
                    }
                    .frame(width: 48, height: 48)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(x: 140, y: -40)
                    
                }

                //tag
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 66, height: 32)
                        .foregroundColor(.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 1))
                    
                    Text("Park")
                        .font(.custom("SFProText-Medium", size: 15))
                        .foregroundColor(.white)
                }.padding(.top, 2)
                    .padding(.trailing, 260)
                
                //informationDetail
                ZStack{
                    HStack (spacing: 32){
                        Text("Misi")
                            .font(.custom("SFProText-Regular", size: 16))
                            .foregroundColor(.white)
                        Text("Jarak")
                            .font(.custom("SFProText-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                }.padding(.leading, 180)
                    .padding(.top, -20)
                
                ZStack{
                    HStack{
                        Text("Fanindo")
                            .font(.custom("SFProDisplay-Medium", size: 28))
                            .padding(.trailing, 100)
                            .foregroundColor(.white)
                        
                        Text("3")
                            .font(.custom("SFProText-Regular", size: 16))
                            .padding(.trailing, 40)
                            .foregroundColor(.white)
                        
                        Text("10 km")
                            .font(.custom("SFProText-Regular", size: 16))
                            .padding(.trailing, 30)
                            .foregroundColor(.white)
                    }.padding(.leading, 10)
                        .padding(.top, 20)
                    
                }.padding(.top, -30)
                
            }
            .padding(.top, -10)
        }.padding(.horizontal, 16)
        
    }
}


struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
