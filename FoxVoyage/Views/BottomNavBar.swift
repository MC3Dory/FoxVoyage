//
//  BottomNavBar.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 19/08/23.
//

import SwiftUI

struct IconNavBar: View {
    
    let image: Image
    let isSelected: Bool
    let action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
                .foregroundColor(isSelected ? Color("Redish400") : Color(.gray))
                .font(.system(size: 25))
        })
    }
}

struct BottomNavBar: View {
    @Binding var currentNavBar: Int
    
    var body: some View {
        HStack {
            IconNavBar (image: Image(systemName: "magnifyingglass"), isSelected: currentNavBar == 0) {currentNavBar = 0}
            IconNavBar (image: Image(systemName: "bookmark"), isSelected: currentNavBar == 1) {currentNavBar = 1}
            IconNavBar (image: Image(systemName: "map"), isSelected: currentNavBar == 2) {currentNavBar = 2}
            IconNavBar (image: Image(systemName: "person.crop.circle.fill"), isSelected: currentNavBar == 3) {currentNavBar = 3}
            
        }
        .frame(height: 50)
        .padding()
        .background(.white)
        .clipShape(Capsule())
        .padding()
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
