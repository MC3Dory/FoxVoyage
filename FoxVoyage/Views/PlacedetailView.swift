//
//  PlacedetailView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct PlacedetailView: View {
    @State private var index = 0
    @State private var indexmission = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                // Carousel - Background Screen
                TabView(selection: $index) {
                    Image("forest")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(0)
                    Image("cafe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(-1) // Set carousel to the backgroundp
                
                // Your other elements
                VStack(alignment: .leading) {
                    ZStack {
                        Rectangle()
                            .frame(width: 358, height: 114)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        VStack {
                            HStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color("Redish400"))
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                }
                                Text("Jembatan Barelang")
                                    .font(.custom("SFProText-Regular", size: 28))
                            }
                            Text("Selesaikan misi untuk mendapatkan fox")
                                .font(.custom("SFProText-Regular", size: 16))
                                .foregroundColor(Color("Black600"))
                        }
                    }
                    
                    Spacer()
                    
                    //tag
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 66, height: 32)
                            .foregroundColor(.clear)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Black400"), lineWidth: 2))
                        Text("Park")
                            .font(.custom("SFProText-Medium", size: 15))
                            .foregroundColor(.white)
                    }
                    
                    
                    //alamat
                    Text("Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau 29466")
                        .font(.custom("SFProText-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    //mission
                    HStack {
                        
                        ZStack{
                            TabView(selection: $indexmission) {
                                ForEach((0..<3), id: \.self) { index in
                                    CardView()
                                    
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                           
                            //pagetabviewcarousel
                            HStack(spacing: 2) {
                                ForEach((0..<3), id: \.self) { index in
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(index == self.indexmission ? Color("Black900") : Color("Black900").opacity(0.5))
                                        .frame(width: 30, height: 5)

                                }
                            }
                            .padding(.bottom, 80)
                            .padding(.trailing, 80)
                        }
                        .frame(height: 200)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 123, height: 112)
                                .foregroundColor(Color("Green200"))
                                .cornerRadius(20)
                            
                            VStack {
                                Text("Tambah ke \nwishlist")
                                    .font(.custom("SFProText-Regular", size: 17))
                                    .foregroundColor(.white)
                                ZStack {
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(.white)
                                    Image(systemName: "bookmark")
                                }.padding(.leading, 67.0)
                            }
                        }
                    }
                }.padding(.horizontal, 16)
            }
            //pagetabview carousel
            HStack(spacing: 8) {
                ForEach((0..<3), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 570)
            .padding(.horizontal, 160)
        }
    }
}

struct CardView: View{
    var body: some View{
        ZStack {
            Rectangle()
                .frame(width: 227, height: 112)
                .foregroundColor(.white)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text("Mencoba makanan pak slamet cihuy")
                    .font(.custom("SFProText-Regular", size: 16))
                    .padding(.top, 20)
                Text("Tambahkan foto")
                    .font(.custom("SFProText-Regular", size: 12))
                    .foregroundColor(Color("Black400"))
                    .padding(.top, 5)
            }
        }
    }
}


struct PlacedetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlacedetailView()
    }
}
