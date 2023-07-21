//
//  ContentView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 15/07/23.
//

import SwiftUI

struct onboardingPage {
    var image: String
    var title: String
    var description: String
}

private var onboardingSteps = [
    onboardingPage(image: "maps", title: "Welcome to FoxVoyage!", description: "Get ready for an adventure of a lifetime! FoxVoyage gamifies your travels, transforming exploration into an exciting quest."),
    onboardingPage(image: "badges", title: "Discover Hidden Gems", description: "Complete photo challenges, earn rewards, and uncover hidden gems along the way."),
    onboardingPage(image: "album", title: "Cherish Your Memories", description: "Never let a precious memory fade away. FoxVoyage's organized picture storage ensures your travel moments are preserved forever. ")
]

struct OnboardingView: View {
    @State private var currentStep = 0
    var orangeButton = 0xffC5593A
    var bgColor = 0xff141736
    
    var body: some View {
        
        TabView(selection: $currentStep) {
            ForEach(0..<onboardingSteps.count,id:\.self) { it in
                
                VStack {
                    VStack {
                        Rectangle()
                            .fill(.white)
                            .opacity(0.0)
                            .frame(maxWidth: .infinity, maxHeight: 550)
                            .overlay {
                                Image(onboardingSteps[it].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                
                            }
                        VStack (alignment: .leading) {
                            
                            Text (onboardingSteps[it].title)
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                                .foregroundColor (currentStep < onboardingSteps.count - 1 ? .black : .white)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                                .frame(maxHeight: 10)
                            
                            Text (onboardingSteps[it].description)
                                .font(.system(size:17))
                                .foregroundColor (currentStep < onboardingSteps.count - 1 ? .black : .white)
                                .multilineTextAlignment(.leading)
                        }
                        .tag(it)
                        
                        .padding(16)
                        
                        Spacer(minLength: 25)
                            .frame(maxHeight: 25)
                        
                    }
                    .background (currentStep < onboardingSteps.count - 1 ? .white : Color(hex: bgColor))
                    .ignoresSafeArea()
                    
                    Button (action: {
                        if currentStep < onboardingSteps.count - 1 {
                            currentStep += 1
                        }
                    }) {
                        if currentStep < onboardingSteps.count - 1 {
                            Text("Next")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 350, height: 50)
                                .background (
                                    Capsule()
                                        .fill(Color(hex: orangeButton))
                                )
                        } else {
                            HStack {
                                Image(systemName: "apple.logo")
                                    .foregroundColor(.black)
                                Text("Sign in with Apple ID")
                                    .foregroundColor(.black)
                            } .frame(width: 350, height: 50)
                                .background (
                                    Capsule()
                                        .fill(Color.white)
                                )
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
}

