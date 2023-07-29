//
//  ContentView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        
        if #available(iOS 16, *){
            NavigationStack{
                InformationNameView()
            }
            
            
        }else{
            NavigationView{
                InformationNameView()
            }
            
            
        }
    }
    
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
