//
//  UserProfileView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 26/07/23.
//

import SwiftUI

struct UserProfileView: View {
    @State private var currentTab: Int = 0
    private let categories = ["Memories", "Statistic"]
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading) {
                Profile ()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    
                    HStack {
                        ForEach(0 ..< categories.count) { i in
                            TabProfile (isActive: i == currentTab, text: categories[i])
                                .onTapGesture {
                                    currentTab = i
                                }
                        }
                        
                    }
                    .padding()
                }
                
                Text("Weekly")
                    .font(.system(size: 25))
                    .padding(.leading, 15)
                
                HStack {
                    ZStack {
                        Rectangle ()
                            .frame(width: 170, height: 150)
                            .foregroundColor(Color("Green200"))
                            .cornerRadius(30)
                            .padding(.leading, 15)
                        
                        VStack (alignment: .leading) {
                            Text ("Trip")
                                .position(x:60, y:25)
                                .foregroundColor(.white)
                                
                                .font(.system(size: 22))
                                
                            
                            Text ("4")
                        }
                    }
                    Spacer()
                    
                    ZStack {
                        Rectangle ()
                            .frame(width: 170, height: 150)
                            .foregroundColor(Color("Green200"))
                            .cornerRadius(30)
                            .padding(.trailing, 15)
                    }
                    
                }
            }
        } .ignoresSafeArea()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

struct Profile: View {
    var body: some View {
        ZStack {
            Image("ProfileBG")
                .resizable()
                .scaledToFit()
            
            Circle()
                .frame(width: 180)
                .foregroundColor(Color("Redish400"))
                .opacity(0.1)
                .overlay(
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color("Redish400"))
                )
        }
    }
}

struct TabProfile: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 20))
                    .foregroundColor(isActive ? Color("Redish400"): Color.black.opacity(0.4))
                
                Spacer()
                
                if (isActive) {
                    Color("Redish400")
                        .frame(width: 90, height: 2)
                        .clipShape(Capsule())
                }
            } .padding(.trailing, 25)
        }
    }
}
