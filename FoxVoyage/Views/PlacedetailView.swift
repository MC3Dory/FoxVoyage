//
//  PlacedetailView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct PlacedetailView: View {
    
    //carousel
    @State private var index = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                // Carousel - Background Screen
                TabView(selection: $index) {
                    ZStack{
                        Image("forest")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .tag(0)
                        
                        VStack {
                            //TASK : MAKSIMAL 2 LINE
                            Text("Nuvasa")
                                .font(.custom("SFProDisplay-Bold", size: 64))
                                .foregroundColor(.white)
                                .padding(.top, 50)
                            Text("Bay")
                                .font(.custom("SFProDisplay-Bold", size: 64))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.clear)
                                    .frame(width: 181, height: 48)
                                
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(Color.white, lineWidth: 1)
                                    .frame(width: 181, height: 48)
                                
                                //TASK: TAG
                                Text("Artificial Attraction")
                                    .font(.custom("SFProText-Medium", size: 15))
                                    .foregroundColor(.white)
                            }.padding(.bottom, 16)
                                .padding(.trailing, 170)
                            
                            //TASK: ALAMAT
                            Text("Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau 29465")
                                .font(.custom("SFProText-Regular", size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.trailing, 30)
                                .padding(.bottom, 50)
                            
                            //TASK: SLIDE ANIMATION FOR CHECKIN
                            ZStack{
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.white)
                                    .frame(width: 358, height: 64)
                                
                                Group{
                                    Circle()
                                        .frame(width: 56, height: 56)
                                        .foregroundColor(Color("Redish400"))
                                    
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color.white)
                                    
                                }.padding(.trailing, 290)
                                
                                Text("Slide to Checkin")
                            }
                        }
                        
                        
                    }
                    
                    ZStack{
                        Color("Violet400")
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .tag(1)
                        VStack (alignment: .leading){
                            
                            Text("About")
                                .font(.custom("SFProText-Regular", size: 17))
                                .foregroundColor(.white)
                            
                            //TASK: NAMA TEMPAT
                            Text("Nuvasa Bay")
                                .font(.custom("SFProDisplay-SemiBold", size: 34))
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 999)
                                        .fill(Color.clear)
                                        .frame(width: 102, height: 48)
                                        
                                    
                                    RoundedRectangle(cornerRadius: 999)
                                        .stroke(Color.white, lineWidth: 1)
                                        .frame(width: 102, height: 48)
                                    
                                    //TASK: TAG
                                    Text("Nongsa")
                                        .font(.custom("SFProText-Medium", size: 15))
                                        .foregroundColor(.white)
                                }
                                
                                VStack{
                                    Text("Operational hour")
                                        .font(.custom("SFProText-Regular", size: 15))
                                        .foregroundColor(.white)
                                    
                                    //TASK : JAM OPERASIONAL TEMPAT
                                    Text("09:00 - 17:00")
                                        .font(.custom("SFProDisplay-Regular", size: 20))
                                        .foregroundColor(.white)
                                }.padding(.leading, 120)
                            }
                            
                            //TASK : GARIS PAS DARI UJUNG KE UJUNG
                            Rectangle()
                                .frame(width: 350, height: 1)
                                .foregroundColor(.white)
                                .padding(.top, 32)
                                
                            
                            //TASK : DESRICTION
                            Text("Nuvasa Bay is a beautiful and vibrant integrated resort destination located on the island of Batam, in the Riau Islands Province of Indonesia.Nestled along the sparkling coastline of the South China Sea, Nuvasa Bay offers a perfect blend of modern facilities, natural beauty, and exciting activities, making it an ideal getaway for travelers seeking a mix of relaxation and adventure")
                                .frame(width: 358, height: 336)
                                .font(.custom("SFProDisplay-Regular", size: 22))
                                .foregroundColor(.white)
                            
                            Spacer()
                            //TASK: SLIDE ANIMATION FOR CHECKIN
                            ZStack{
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.white)
                                    .frame(width: 358, height: 64)
                                
                                Group{
                                    Circle()
                                        .frame(width: 56, height: 56)
                                        .foregroundColor(Color("Redish400"))
                                    
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color.white)
                                    
                                }.padding(.trailing, 290)
                                
                                Text("Slide to capture momen")
                            }
                        }
                        
                            
                      
                    }

                    Color("Redish100")
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(-1) // Set carousel to the backgroundp
                
                
            }
            
            //pagetabview carousel
            HStack(spacing: 8) {
                ForEach((0..<3), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 650)
            .padding(.horizontal, 164)
        }
        
    }
    
}


struct PlacedetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlacedetailView()
    }
}
