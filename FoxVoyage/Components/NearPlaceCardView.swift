//
//  NearPlaceCardView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 28/07/23.
//


import SwiftUI

struct NearPlaceCardView: View {
    
    let place: PlaceModel
    @State var isAddTowishList: Bool = false
    
    var body: some View{
        
        ZStack{
            Rectangle()
                .frame(width: 358, height: 284)
                .cornerRadius(30)
                //TASK : WARNA SESUAI TAG
                .foregroundColor(Color("Red100"))
            
            VStack{
                ZStack{
                    HStack (spacing:0){
                        ZStack{
                            Image("place1")
                            Button(action:{
                                isAddTowishList.toggle()
                            }){
                                ZStack{
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: isAddTowishList ? "bookmark" : "bookmark.fill")
                                        .foregroundColor( isAddTowishList ? .black : Color("Redish400"))
                                }
                            }
                            
                        }
                        
                        ZStack{
                            Image("place2")
                            Button(action:{
                                isAddTowishList.toggle()
                            }){
                            }
                        }
                        
                    }.padding(.top, -20)
                }
                
                //TASK : TAG
                
                ZStack{
                    RoundedRectangle(cornerRadius: 999)
                        .fill(Color.clear)
                        .frame(width: 181, height: 48)
                    
                    RoundedRectangle(cornerRadius: 999)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(width: 181, height: 48)
                    
                    //TASK: TAG
                    Text(place.tag ?? "Tag Placeholder")
                        .font(.custom("SFProText-Medium", size: 15))
                        .foregroundColor(.white)
                    
                    
                }.padding(.leading, -150)
                    
                
                HStack (spacing : 40){
                    //TASK : NAMA TEMPAT
                    
                    Text(place.name ?? "Name Placeholder")
                        .font(.custom("SFProDisplay-Medium", size: 28))
                        .foregroundColor(.white)
                    
                    VStack{
                        Text("Misi")
                            .font(.custom("SFProText-Regular", size: 16))
                            .foregroundColor(.white)
                        //TASK : JUMLAH MISI
                        Text("3")
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            .foregroundColor(.white)
                    }.padding(.leading, 50)
                    
                    VStack{
                        Text("Jarak")
                            .font(.custom("SFProText-Regular", size: 16))
                            .foregroundColor(.white)
                        
                        //TASK : JARAK
                        Text("1.8 km")
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            .foregroundColor(.white)
                    }
                    
                        
                }
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

struct NearPlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        NearPlaceCardView(place: .example)
    }
}

