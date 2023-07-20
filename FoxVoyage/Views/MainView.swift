//
//  MainView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct MainView: View {
    
    init(){
        printFonts()
    }
    
    func printFonts(){
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames{
            print("---------------")
            print("Font family name -> [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names -> [\(names)]")
        }
    }
    
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
                    .frame(width: 266, height: 64)
                    .cornerRadius(999)
                    .foregroundColor(Color("Redish400"))
                
                HStack (spacing: 12){
                    Text("Check In")
                        .font(.custom("SFProDisplay-Medium", size: 17))
                        .foregroundColor(.white)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }

            }
            
            ZStack{
                Rectangle()
                    .frame(width: 359, height: 72)
                    .cornerRadius(999)
                    .foregroundColor(.white)
                
                HStack (spacing: 52){
                    Image(systemName: "map.fill")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
