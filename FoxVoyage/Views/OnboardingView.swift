//
//  OnBoardingView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import SwiftUI

struct onboardingPage {
    var image: String
    var title: String
    var description: String
}

private var onboardingSteps = [
    onboardingPage(image: "maps", title: "Welcome to FoxVoyage", description: "Get ready for an adventure of a lifetime! FoxVoyage gamifies your travels, transforming exploration into an exciting quest."),
    onboardingPage(image: "badgesonboarding", title: "Discover Hidden Gems", description: "Complete photo challenges, earn rewards, and uncover hidden gems along the way."),
    onboardingPage(image: "album", title: "Cherish Your Memories", description: "Never let a precious memory fade away. FoxVoyage's organized picture storage ensures your travel moments are preserved forever. ")
]

struct OnboardingView: View {
    @EnvironmentObject var router: Router
    @State private var currentStep = 0
    @State var backToRoot: Bool = false
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
                                    .aspectRatio(contentMode: currentStep == 1 ? .fill : .fill)
                                    .frame(maxWidth: .infinity)
                            }
                        
                        VStack (alignment: .leading) {
                            
                            Text (onboardingSteps[it].title)
                                .font(.custom("SFProDisplay-Regular", size: 28))
                                .foregroundColor (currentStep < onboardingSteps.count - 1 ? .black : .white)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                                .frame(maxHeight: 10)
                            
                            Text (onboardingSteps[it].description)
                                .font(.custom("SFProText-Regular", size: 17))
                                .foregroundColor (currentStep < onboardingSteps.count - 1 ? Color("Black400") : .white)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .tag(it)
                        
                        .padding(16)
                        
                        Spacer(minLength: 25)
                        
                    }
                    .background (currentStep < onboardingSteps.count - 1 ? .white : Color(hex: bgColor))
                    .ignoresSafeArea()
                    
                    Button{
                        if currentStep < onboardingSteps.count - 1 {
                            currentStep += 1
                        }
                    }label : {
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
                            Button{
                                router.push(.galleryAccess)
                            } label: {
                                HStack {
                                    Text("Get Started")
                                        .foregroundColor(.black)
                                }
                                .frame(width: 350, height: 50)
                                .background (
                                    Capsule()
                                        .fill(Color.white)
                                )
                            }
                            
                            
                            
                            
                            
                        }
                    }
                    .ignoresSafeArea(.all)
                }.background(currentStep == 2 ? Color(hex: bgColor) : .white)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
        }.ignoresSafeArea()
        
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
}

