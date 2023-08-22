//
//  MissionScrollView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 18/08/23.
//

import SwiftUI

struct QuestsItem : Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var type: DestinationCategory
}

private var questList = [
    QuestsItem(title: "Picnic Perfection", description: "Set up a charming picnic spot and capture the joy of sharing a meal with loved ones.", type: .park),
    QuestsItem(title: "Nature Trailblazer", description: "Explore a scenic nature trail and photograph fascinating flora and fauna along the way.", type: .nature),
    QuestsItem(title: "Playtime Fun", description: "Snap a candid shot of kids playing joyfully on the swings or slides.", type: .park),
    QuestsItem(title: "Blooming Beauties", description: "Capture the vibrant colors of blooming flowers in the park's gardens.", type: .park),
    QuestsItem(title: "Silhouette Magic", description: "Capture stunning silhouettes during golden hour with people or trees against the setting sun.", type: .nature),
    QuestsItem(title: "Peaceful Pond", description: "Find a quiet pond, photographing ducks or swans gracefully gliding on the water.", type: .nature),
    QuestsItem(title: "Paws and Play", description: "Take a picture of adorable dogs playing fetch or chasing bubbles.", type: .park),
    QuestsItem(title: "Park Yoga", description: "Snap a photo of someone practicing yoga amidst the greenery.", type: .park),
    QuestsItem(title: "Friendly Sports", description: "Capture a friendly game of soccer, frisbee, or any other sport being played in the park.", type: .artificial),
    QuestsItem(title: "Sandcastle Dreams", description: "Photograph an intricate sandcastle creation by talented beachgoers.", type: .beach),
    QuestsItem(title: "Seashell Treasures", description: "Capture an artistic shot of colorful seashells collected along the shore.", type: .beach),
    QuestsItem(title: "Volleyball Fun", description: "Snap a picture of a lively game of beach volleyball in action.", type: .beach),
    QuestsItem(title: "Ocean Glimpse", description: "Take a photo of the sparkling ocean with the sun glistening on the waves.", type: .beach),
    QuestsItem(title: "Beach Hues", description: "Photograph beach umbrellas or sunbeds with vivid colors against the sandy backdrop.", type: .beach),
    QuestsItem(title: "Sunset Stunner", description: "Capture the breathtaking beauty of a beach sunset, painting the sky with vibrant colors.", type: .beach),
    QuestsItem(title: "Seaside Silhouettes", description: "Capture silhouettes of friends or loved ones walking hand in hand along the water's edge.", type: .beach),
    QuestsItem(title: "Hidden Treasures", description: "Seek and photograph hidden gems, uncovering the mysteries of your chosen destination.", type: .artificial),
    QuestsItem(title: "Adventure Thrills", description: "Embark on adrenaline-pumping activities and capture the thrill of your daring exploits.", type: .nature),
    QuestsItem(title: "Cultural Mosaic", description: "Immerse yourself in local traditions and festivals, preserving the essence of diverse cultures.", type: .artificial),
    QuestsItem(title: "City Lights Delight", description: "Embrace the night's allure and photograph city lights in all their glory.", type: .artificial),
    QuestsItem(title: "Floral Fantasia", description: "Get lost in a garden of blooming flowers, preserving the splendor of nature's colors.", type: .artificial),
    QuestsItem(title: "Local Flavors", description: "Savor local culinary delights and capture the delicious memories on your plate.", type: .artificial),
    QuestsItem(title: "Journey's End", description: "Capture the jubilant moments as you reach your travel milestones and cherish the experiences forever.", type: .nature)
]

enum DestinationCategory: Int {
    case nature
    case artificial
    case beach
    case park
}

struct MissionScrollView: View {

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(questList) {
                        quest in
                        QuestCards(quest: quest)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct MissionScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MissionScrollView()
    }
}

struct QuestCards: View {
    var quest: QuestsItem
    
    var body: some View {
        ZStack {
            Color(.white)
                .frame(width: 350, height: 150, alignment: .center)
                .cornerRadius(15)
            
            HStack {
                VStack (alignment: .leading) {
                    
                    Text(quest.title)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    
                    Text("Description:")
                        .font(.system(size: 10))
                    
                    Text(quest.description)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    
                }
                
                Spacer()
                ZStack {
                    Image ("locked")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                }
                
            }
            .padding(.horizontal)
        }
    }
}
