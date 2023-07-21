//
//  ExploreView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 175, height: 56)
                        .cornerRadius(999)
                        .foregroundColor(.white)
                    
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color("Green200"))
                        .padding(.trailing, 123)
                        .padding(.leading, 4)
                    
                    Image(systemName: "rectangle.dashed.and.paperclip")
                        .padding(.trailing, 123)
                        .padding(.leading, 4)
                    
                    Text("4")
                        .font(.custom("SFProDisplay-Medium", size: 20))
                        .padding(.leading, 25)
                }
                
                ZStack{
                    Rectangle()
                        .frame(width: 175, height: 56)
                        .cornerRadius(999)
                        .foregroundColor(.white)
                    
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color("Green200"))
                        .padding(.trailing, 123)
                        .padding(.leading, 4)
                    
                    Image(systemName: "rectangle.dashed.and.paperclip")
                        .padding(.trailing, 123)
                        .padding(.leading, 4)
                    
                    Text("4")
                        .font(.custom("SFProDisplay-Medium", size: 20))
                        .padding(.leading, 25)
                }
                
                
            }
            
            Spacer()
            
            ZStack{
                Rectangle()
                    .frame(width: 341, height: 152)
                    .cornerRadius(25)
                    .foregroundColor(.white)
                HStack{
                    Image("exampleimage")
                    
                    VStack (alignment: .leading){
                        Text("Jembatan\nBalerang")
                            .font(.system(size: 22))
                            .padding(.bottom, 2)
                        Text("1.8 km")
                            .font(.system(size: 12))
                            .foregroundColor(Color("Black400"))
                            .padding(.bottom, 22)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 66, height: 32)
                                .foregroundColor(.white)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Black400"), lineWidth: 2))
                            Text("3 misi")
                                .font(.system(size: 12))
                                .foregroundColor(Color("Black400"))
                        }
                        
                    }.padding(.leading, 16)
                    
                    
                    ZStack{
                        Circle()
                            .frame(width: 64, height: 64)
                            .foregroundColor(Color("Redish400"))
                            
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.white)
                    }.padding(.top, 72)
                    
                    
                }
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Map")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
