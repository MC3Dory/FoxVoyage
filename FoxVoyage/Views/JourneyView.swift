//
//  JourneyView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 25/07/23.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let systemImageName: String
    var isActive: Bool
}


struct JourneyView: View {
    @State private var activeTabIndex = 0
    
    private let tabItems: [TabItem] = [
        TabItem(systemImageName: "map.fill", isActive: true),
        TabItem(systemImageName: "bookmark", isActive: false),
        TabItem(systemImageName: "rectangle.dashed.and.paperclip", isActive: false),
        TabItem(systemImageName: "person", isActive: false)
    ]
    
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
            
            
            //tabview
            ZStack {
                Rectangle()
                    .frame(width: 359, height: 72)
                    .cornerRadius(999)
                    .foregroundColor(.white)
                
                HStack (spacing: 40) {
                    ForEach(tabItems) { item in
                        Button(action: {
                            activeTabIndex = tabItems.firstIndex(where: { $0.id == item.id }) ?? 0
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 56, height: 56)
                                    .foregroundColor(item.isActive ? Color("Redish400") : .white)
                                
                                Image(systemName: item.systemImageName)
                                    .font(.system(size: 18))
                                    .foregroundColor(item.isActive ? .white : Color("Black400"))
                            }
                        }
                    }
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

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView()
    }
}
