//
//  WishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct WishlistView: View {
    
    @State var places: [PlaceModel] = []
    
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
            
            //wishlist card
            //TASK : MASUKIN WISHLIST USER
            if !places.isEmpty{
                VStack (spacing: 50){
                    WishlistcardView(place : places[0])
                    WishlistcardView(place : places[21])
                    WishlistcardView(place : places[2])
        
                }.padding(.top, 40)
            } else{
                ProgressView()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Redish100"))
        
        .onAppear{
            fetchPlaces()
        }
    }
    func fetchPlaces(){
        //taruh isloading
        places = CoreDataController.sharedInstance.fetchPlaceModels()
        //
    }
    
}


//struct WishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        WishlistView()
//    }
//}
