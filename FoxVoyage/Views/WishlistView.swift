//
//  WishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct WishlistView: View {
    
    @State private var activeTabIndex = 0
    
    private let tabItems: [TabItem] = [
        TabItem(systemImageName: "map.fill", isActive: true),
        TabItem(systemImageName: "bookmark", isActive: false),
        TabItem(systemImageName: "rectangle.dashed.and.paperclip", isActive: false),
        TabItem(systemImageName: "person", isActive: false)
    ]
    
    let text = "Mega Wisata Ocarina"
    
    var body: some View {
        VStack{
            //user
            HStack{
                Text("Hi,")
                    .font(.custom("SFProDisplay-Regular", size: 20))
                    .foregroundColor(Color("Black600"))
                
                Text("Kelly")
                    .font(.custom("SFProDisplay-Regular", size: 20))
                    .foregroundColor(Color("Redish400"))
            }.padding(.trailing, 290)
            
            
            
            Text("Looks like you haven't crafted your fantastic \ntravel plan yet!")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .foregroundColor(Color("Black900"))
                .padding(.trailing, 50)
            
            WishListCard()
            
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
        .background(Color("Redish100"))
    }
    

    
    
}




struct WishListCard : View{
    let text = "Mega Wisata Ocarina"
    var body: some View{
        ZStack{
            
            Rectangle()
                .frame(width: 358, height: 100)
                .cornerRadius(30)
                .foregroundColor(Color("Red100"))
            
            VStack (spacing: 0){
                
                HStack(spacing: 40){
                    VStack (alignment: .leading){
                        ForEach(splitText(text: text, maxWords: 2), id: \.self) { chunk in
                            Text(chunk.joined(separator: " "))
                                .foregroundColor(.white)
                                .font(.custom("SFProDisplay-Medium", size: 28))
                        }
                        
                    }
                    
                    Text("Misi")
                        .foregroundColor(.white)
                        .font(.custom("SFProText-Regular", size: 16))
                    Text("Jarak")
                        .foregroundColor(.white)
                        .font(.custom("SFProText-Regular", size: 16))
                }
                HStack (spacing: 40){
                    Text("3")
                        .foregroundColor(.white)
                        .font(.custom("SFProText-Display", size: 20))
                    Text("1.8 km")
                        .foregroundColor(.white)
                        .font(.custom("SFProText-Display", size: 20))
                }.padding(.leading, 190)
            }
            
        }
    }
    // Fungsi untuk membagi teks menjadi bagian-bagian dengan dua kata dalam setiap bagian
    func splitText(text: String, maxWords: Int) -> [[String]] {
        var chunks: [[String]] = []
        let words = text.split(separator: " ")
        
        for index in stride(from: 0, to: words.count, by: maxWords) {
            let endIndex = min(index + maxWords, words.count)
            let chunk = Array(words[index..<endIndex])
            chunks.append(chunk.map { String($0) })
        }
        
        return chunks
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
