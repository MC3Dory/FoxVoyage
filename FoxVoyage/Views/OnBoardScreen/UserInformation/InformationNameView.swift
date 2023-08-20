//
//  InformationNameView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 22/07/23.
//

import SwiftUI

struct InformationNameView: View {
    @EnvironmentObject var viewModel : InformationViewModel
    @EnvironmentObject var router : Router

    
    var body: some View {
        VStack{
            VStack{
                Text("Welcome aboard!")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("We're all set to begin, ")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("but first, what should ")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("we call you?")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                
            }
            
            TextField("Your name....", text: $viewModel.name)
                .font(.custom("SFProDisplay-Regular", size: 34))
                .frame(maxWidth: 355, alignment: .leading)
                .foregroundColor(Color("Redish400"))
            
            
            Spacer()
            
            
            Button{
                router.push(.infoLocation)
            } label: {
                HStack{
                    Text("Next")
                        .font(.custom("SFProText-Regular", size: 17))
                        .foregroundColor(.white)
                    Image(systemName: "arrow.up.forward")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 358, maxHeight: 64)
                .background(viewModel.name.isEmpty ? Color.gray : Color("Redish400")).background(Color("Redish400"))
                .cornerRadius(999)
                
            }
            .disabled(viewModel.name.isEmpty)
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

struct InformationNameView_Previews: PreviewProvider {
    static var previews: some View {
        InformationNameView()
            .environmentObject(InformationViewModel())
    }
}
