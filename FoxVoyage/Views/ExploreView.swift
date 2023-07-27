//
//  ExploreView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct ExploreView: View {
    @State var places: [PlaceModel] = []
    //addwishlist
    @State private var isAddTowishList = false
    
    var body: some View {
        VStack{
            HStack{
                
                //profile photo
                ZStack{
                    Circle()
                        .frame(width: 72, height: 72)
                        .foregroundColor(Color("Redish400"))
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                }.padding(.leading, 40)
                
                
                Spacer()
                
                //sum
                ZStack{
                    RoundedRectangle(cornerRadius: 999)
                        .frame(width: 105, height: 56)
                        .foregroundColor(Color("Redish100"))
                    
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color("Green200"))
                            
                            //TASK : GANTI DENGAN ICON
                            Image(systemName: "bookmark")
                                .foregroundColor(.white)
                        }
                        
                        //TASK : DATA
                        Text("0")
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            
                            
                    }.padding(.leading, -25)
                    
                    
                }.padding(.trailing)
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 999)
                        .frame(width: 105, height: 56)
                        .foregroundColor(Color("Redish100"))
                    HStack{
                        ZStack{
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color("Green200"))
                            
                            //TASK : GANTI DENGAN ICON
                            Image(systemName: "bookmark")
                                .foregroundColor(.white)
                        }
                        
                        //TASK : DATA
                        Text("0")
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            
                            
                    }.padding(.leading, -25)
                        
                   
                }.padding(.trailing, 30)
            }
            
            Text("Your Current Location")
                .font(.custom("SFProDisplay-Regular", size: 22))
                .padding(.leading, -150)
                .padding(.top, 10)
            
            
            //checkin
            ZStack{
                Rectangle()
                    .frame(width: 358, height: 163)
                    .cornerRadius(30)
                    .foregroundColor(Color("Redish100"))
                    .padding(.horizontal, 16)
                
                VStack{
                    
                    HStack (spacing: 50){
                        
                        //TASK : NAMA TEMPAT
                        Text("Fanindo")
                            .font(.custom("SFProDisplay-Medium", size: 28))
                            .foregroundColor(Color("Black900"))
                            .padding(.leading, -5)
                        
                        VStack{
                            Text("Misi")
                                .font(.custom("SFProText-Regular", size: 16))
                                .foregroundColor(Color("Black900"))
                            //TASK : JUMLAH MISI
                            Text("3")
                                .font(.custom("SFProDisplay-Medium", size: 20))
                                .foregroundColor(Color("Black900"))
                        }.padding(.leading, 50)
                        
                        VStack{
                            Text("Jarak")
                                .font(.custom("SFProText-Regular", size: 16))
                                .foregroundColor(Color("Black900"))
                            
                            //TASK : JARAK
                            Text("1.8 km")
                                .font(.custom("SFProDisplay-Medium", size: 20))
                                .foregroundColor(Color("Black900"))
                        }
                        
                        
                    }
                    
                    //TASK : ANIMASI SLIDE TO CHECKIN
                    ZStack{
                        RoundedRectangle(cornerRadius: 999)
                            .fill(Color.white)
                            .frame(width: 325, height: 64)
                        
                        Group{
                            Circle()
                                .frame(width: 56, height: 56)
                                .foregroundColor(Color("Redish400"))
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color.white)
                            
                        }.padding(.trailing, 250)
                        
                        Text("Slide to capture momen")
                            .padding(.leading, 30)
                    }
                    
                    

                }
            }
            
            //popular group
            Group{
                HStack{
                    Text("Popular")
                        .font(.custom("SFProDisplay-Regular", size: 22))
                        
                    
                    Spacer()
                    Button(action: {}, label: {
                        Text("See all")
                            .font(.custom("SFProText-Regular", size: 15))
                            .foregroundColor(Color("Redish400"))
                            .underline()
                    })
                }.padding(.horizontal, 40)
                    .padding(.top, 24)
                
                if !places.isEmpty{
                    HStack (spacing: 30){
//                        PopularPlaceCard(place: places[0])
//                        PopularPlaceCard(place: places[0])
                        
                        ForEach(places){ place in
                            PopularPlaceCard(place: place)
                        }
                    }
                } else{
                    ProgressView()
                }
                
                
            }
            
            Group{
                HStack{
                    Text("Popular")
                        .font(.custom("SFProDisplay-Regular", size: 22))
                        
                    
                    Spacer()
                    Button(action: {}, label: {
                        Text("See all")
                            .font(.custom("SFProText-Regular", size: 15))
                            .foregroundColor(Color("Redish400"))
                            .underline()
                    })
                }.padding(.horizontal, 40)
                    .padding(.top, 24)
                
                ScrollView{
                    
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
                                            ZStack{
                                                Circle()
                                                    .frame(width: 48, height: 48)
                                                    .foregroundColor(.white)
                                                
                                                Image(systemName: isAddTowishList ? "bookmark" : "bookmark.fill")
                                                    .foregroundColor( isAddTowishList ? .black : Color("Redish400"))
                                            }
                                        }
                                        
                                    }
                                    
                                }
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
                                Text("Artificial Attraction")
                                    .font(.custom("SFProText-Medium", size: 15))
                                    .foregroundColor(.white)
                                
                                
                            }.padding(.leading, -150)
                                
                            
                            HStack (spacing : 40){
                                //TASK : NAMA TEMPAT
                                Text("Nuvasa \nBay")
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
                                            ZStack{
                                                Circle()
                                                    .frame(width: 48, height: 48)
                                                    .foregroundColor(.white)
                                                
                                                Image(systemName: isAddTowishList ? "bookmark" : "bookmark.fill")
                                                    .foregroundColor( isAddTowishList ? .black : Color("Redish400"))
                                            }
                                        }
                                        
                                    }
                                    
                                }
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
                                Text("Artificial Attraction")
                                    .font(.custom("SFProText-Medium", size: 15))
                                    .foregroundColor(.white)
                                
                                
                            }.padding(.leading, -150)
                                
                            
                            HStack (spacing : 40){
                                //TASK : NAMA TEMPAT
                                Text("Nuvasa \nBay")
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
                
            }
           
            
            
            Spacer()
            
            
        }
        
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
