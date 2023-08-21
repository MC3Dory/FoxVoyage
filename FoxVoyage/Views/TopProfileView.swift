//
//  TopProfileView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 18/08/23.
//

import SwiftUI

struct TopProfileView: View {
    var body: some View {
      
                ZStack {
                    Image("ProfileBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 100)
                        .ignoresSafeArea()
                    
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
                    
                    Text("Jonison")
                        .frame(height: 41)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft])
                        .position(x: 120, y: 100)
                    
                }
                .frame(maxHeight: 300)
                .background(.blue)
                .ignoresSafeArea()
            }
        }

struct TopProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileView()
    }
}
