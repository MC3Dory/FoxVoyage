//
//  ContentView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI



struct ContentView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    var body: some View {
        ExploreView()
//        if showOnboarding {
//            OnboardingView()
//        }else{
//            ExploreView()
//        }
    }
    
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
