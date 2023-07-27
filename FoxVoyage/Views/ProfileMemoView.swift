//
//  ProfileMemoView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 27/07/23.
//

import SwiftUI

struct ProfileMemoView: View {
    
    var body: some View {
        
        ScrollView {
            VStack {
                ZStack{
                    Rectangle()
                        .frame(height: 200, alignment: .center)
                        .foregroundColor(.blue)
                        .cornerRadius(30)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                    
                    HStack {
                        
                            
                    }
                }
            }
        }
        
    }
}

struct ProfileMemoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMemoView(title: "String", month: "String", moments: "2", date: 2, totMoments: 2)
    }
}
