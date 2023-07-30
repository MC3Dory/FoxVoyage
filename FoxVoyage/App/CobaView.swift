//
//  CobaView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 30/07/23.
//

import SwiftUI

struct CobaView: View {
    let picData: Data
    var body: some View {
        Image(uiImage: UIImage(data: picData)!)
            .resizable()
            .scaledToFill()
            .frame(width: 200)
    }
}

struct CobaView_Previews: PreviewProvider {
    static var previews: some View {
        CobaView(picData: Data(count: 0))
    }
}
