//
//  UserProfileView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 26/07/23.
//

import SwiftUI

struct UserProfileView: View {
    @State private var currentTab: Int = 0
    @State private var currentNavBar: Int = 0
    
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading) {
                TopProfileView ()

                TabProfile(currentTab: $currentTab)
                
                if currentTab == 0 {
                    ProfileMemoView()
                } else {
                    WeeklyView()
                    Spacer()
                }
                
            }
            .frame(maxHeight: .infinity)
            .ignoresSafeArea()
            
            BottomNavBar(currentNavBar: $currentNavBar)

        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

struct ProfileTabItem: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            Text(text)
                .font(.system(size: 20))
                .foregroundColor(isActive ? Color("Redish400"): Color.black.opacity(0.4))
            
            if (isActive) {
                Color("Redish400")
                    .frame(width: 90, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing, 25)
    }
}

struct TabProfile: View {
    @Binding var currentTab: Int
    private let categories = ["Memories", "Record"]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                ForEach(0...categories.count - 1, id:\.self) { i in
                    ProfileTabItem (isActive: i == currentTab, text: categories[i])
                        .onTapGesture {
                            currentTab = i
                        }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            Divider()
        }
    }
}
