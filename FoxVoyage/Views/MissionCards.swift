//
//  MissionCards.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 23/07/23.
//

import SwiftUI

struct questsCards : Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var type: DestinationCategory
}

private var questList = [
    questsCards(title: "Picnic Perfection", description: "Set up a charming picnic spot and capture the joy of sharing a meal with loved ones.", type: .park),
    questsCards(title: "Nature Trailblazer", description: "Explore a scenic nature trail and photograph fascinating flora and fauna along the way.", type: .nature),
    questsCards(title: "Playtime Fun", description: "Snap a candid shot of kids playing joyfully on the swings or slides.", type: .park),
    questsCards(title: "Blooming Beauties", description: "Capture the vibrant colors of blooming flowers in the park's gardens.", type: .park),
    questsCards(title: "Silhouette Magic", description: "Capture stunning silhouettes during golden hour with people or trees against the setting sun.", type: .nature),
    questsCards(title: "Peaceful Pond", description: "Find a quiet pond, photographing ducks or swans gracefully gliding on the water.", type: .nature),
    questsCards(title: "Paws and Play", description: "Take a picture of adorable dogs playing fetch or chasing bubbles.", type: .park),
    questsCards(title: "Park Yoga", description: "Snap a photo of someone practicing yoga amidst the greenery.", type: .park),
    questsCards(title: "Friendly Sports", description: "Capture a friendly game of soccer, frisbee, or any other sport being played in the park.", type: .artificial),
    questsCards(title: "Sandcastle Dreams", description: "Photograph an intricate sandcastle creation by talented beachgoers.", type: .beach),
    questsCards(title: "Seashell Treasures", description: "Capture an artistic shot of colorful seashells collected along the shore.", type: .beach),
    questsCards(title: "Volleyball Fun", description: "Snap a picture of a lively game of beach volleyball in action.", type: .beach),
    questsCards(title: "Ocean Glimpse", description: "Take a photo of the sparkling ocean with the sun glistening on the waves.", type: .beach),
    questsCards(title: "Beach Hues", description: "Photograph beach umbrellas or sunbeds with vivid colors against the sandy backdrop.", type: .beach),
    questsCards(title: "Sunset Stunner", description: "Capture the breathtaking beauty of a beach sunset, painting the sky with vibrant colors.", type: .beach),
    questsCards(title: "Seaside Silhouettes", description: "Capture silhouettes of friends or loved ones walking hand in hand along the water's edge.", type: .beach),
    questsCards(title: "Hidden Treasures", description: "Seek and photograph hidden gems, uncovering the mysteries of your chosen destination.", type: .artificial),
    questsCards(title: "Adventure Thrills", description: "Embark on adrenaline-pumping activities and capture the thrill of your daring exploits.", type: .nature),
    questsCards(title: "Cultural Mosaic", description: "Immerse yourself in local traditions and festivals, preserving the essence of diverse cultures.", type: .artificial),
    questsCards(title: "City Lights Delight", description: "Embrace the night's allure and photograph city lights in all their glory.", type: .artificial),
    questsCards(title: "Floral Fantasia", description: "Get lost in a garden of blooming flowers, preserving the splendor of nature's colors.", type: .artificial),
    questsCards(title: "Local Flavors", description: "Savor local culinary delights and capture the delicious memories on your plate.", type: .artificial),
    questsCards(title: "Journey's End", description: "Capture the jubilant moments as you reach your travel milestones and cherish the experiences forever.", type: .nature)
]

enum DestinationCategory: Int {
    case nature = 0xff45B289
    case artificial = 0xff515BA2
    case beach = 0xff53B1C5
    case park = 0xffFD9380
}

struct MissionCards: View {
    
    var body: some View {
        VStack {
            
            VStack (alignment: .leading) {
                Text ("Fox Quests")
                    .font(.system(size: 41))
                    .foregroundColor(Color.black)
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                    .padding(.top, 30)
                
                Text ("A series of captivating challenges designed to ignite your wanderlust and preserve every cherished moment along the way.")
                    .font(.system(size: 16))
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.gray)
                    .padding(.bottom)
                    
                ScrollView {
                    VStack {
                        ForEach(questList) {
                            quest in
                            ZStack {
                                Color(hex: quest.type.rawValue)
                                    .frame(width: 350, height: 200, alignment: .center)
                                    .cornerRadius(15)
                                    
                                HStack {
                                    VStack (alignment: .leading) {
                                        Text ("Quest:")
                                        Text(quest.title)
                                            .font(.system(size: 22))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 5)
                                        
                                        Text("Description:")
                                            .font(.system(size: 10))
                                        
                                        Text(quest.description)
                                            .font(.system(size: 10))
                                            .foregroundColor(.white)
                                        
                                    }
                                
                                    Spacer()
                                    ZStack {
                                        Image ("sticker")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 180, height: 180)
                                        
                                        Image ("Fox")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 110, height: 110)
                                        
                                    }
                        
                                }.padding(.horizontal)
                                
                                Circle ()
                                    .frame(width: 115)
                                    .foregroundColor(Color.gray)
                                    .opacity(0.6)
                                
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

struct MissionCards_Previews: PreviewProvider {
    static var previews: some View {
        MissionCards()
    }
}
