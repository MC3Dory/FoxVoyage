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
                ForEach(0 ..< 10) { Memo in
                    Rectangle()
                        .frame(height: 200, alignment: .center)
                        .cornerRadius(30)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                    
                }
            }
        }
        
    }
}

struct ProfileMemoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMemoView()
    }
}
