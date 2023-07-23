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
}

private var questList = [
    questsCards(title: "Picnic Perfection", description: "Set up a charming picnic spot and capture the joy of sharing a meal with loved ones."),
    questsCards(title: "Nature Trailblazer", description: "Explore a scenic nature trail and photograph fascinating flora and fauna along the way."),
    questsCards(title: "Playtime Fun", description: "Snap a candid shot of kids playing joyfully on the swings or slides."),
    questsCards(title: "Blooming Beauties", description: "Capture the vibrant colors of blooming flowers in the park's gardens."),
    questsCards(title: "Silhouette Magic", description: "Capture stunning silhouettes during golden hour with people or trees against the setting sun."),
    questsCards(title: "Peaceful Pond", description: "Find a quiet pond, photographing ducks or swans gracefully gliding on the water."),
    questsCards(title: "Paws and Play", description: "Take a picture of adorable dogs playing fetch or chasing bubbles."),
    questsCards(title: "Park Yoga", description: "Snap a photo of someone practicing yoga amidst the greenery."),
    questsCards(title: "Friendly Sports", description: "Capture a friendly game of soccer, frisbee, or any other sport being played in the park."),
    questsCards(title: "Sandcastle Dreams", description: "Photograph an intricate sandcastle creation by talented beachgoers."),
    questsCards(title: "Seashell Treasures", description: "Capture an artistic shot of colorful seashells collected along the shore."),
    questsCards(title: "Volleyball Fun", description: "Snap a picture of a lively game of beach volleyball in action."),
    questsCards(title: "Ocean Glimpse", description: "Take a photo of the sparkling ocean with the sun glistening on the waves."),
    questsCards(title: "Beach Hues", description: "Photograph beach umbrellas or sunbeds with vivid colors against the sandy backdrop."),
    questsCards(title: "Sunset Stunner", description: "Capture the breathtaking beauty of a beach sunset, painting the sky with vibrant colors."),
    questsCards(title: "Seaside Silhouettes", description: "Capture silhouettes of friends or loved ones walking hand in hand along the water's edge."),
    questsCards(title: "Hidden Treasures", description: "Seek and photograph hidden gems, uncovering the mysteries of your chosen destination."),
    questsCards(title: "Adventure Thrills", description: "mbark on adrenaline-pumping activities and capture the thrill of your daring exploits."),
    questsCards(title: "Cultural Mosaic", description: "Immerse yourself in local traditions and festivals, preserving the essence of diverse cultures."),
    questsCards(title: "City Lights Deligh", description: "Embrace the night's allure and photograph city lights in all their glory."),
    questsCards(title: "Floral Fantasia", description: "Get lost in a garden of blooming flowers, preserving the splendor of nature's colors."),
    questsCards(title: "Local Flavors", description: "Savor local culinary delights and capture the delicious memories on your plate."),
    questsCards(title: "Journey's End", description: "Capture the jubilant moments as you reach your travel milestones and cherish the experiences forever.")
]



struct MissionCards: View {
    var orange = 0xffC5593A
    var violet = 0xff292D5A
    
    var body: some View {
        VStack {
            
            VStack (alignment: .leading) {
                Text ("Fox Quests")
                    .font(.system(size: 41))
                    .foregroundColor(Color.black)
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                    .padding(.top, 35)
                
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
                                Color(hex: violet)
                                    .frame(width: 350, height: 200, alignment: .center)
                                    .cornerRadius(15)
                                   
                                
                                Circle ()
                                    .frame(width: 115)
                                    .foregroundColor(Color.gray)
                                    .opacity(0.6)
                                
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    
                                HStack(alignment: .top) {
                                    VStack{
                                        Text(quest.title)
                                            .font(.system(size: 22))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 10)
                                        
                                        Text(quest.description)
                                            .font(.system(size: 10))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 10)
                                        
                                    } .padding(.leading, 13)
                                
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
                        
                                }
                                
                            } .padding(.horizontal)
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
