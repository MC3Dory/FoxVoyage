//
//  InformationLocationView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 23/07/23.
//

import SwiftUI

struct InformationLocationView: View {
    var body: some View {
        if #available(iOS 16, *){
            NavigationStack{
                SearchView()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }else{
            NavigationView{
                SearchView()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct InformationLocationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationLocationView()
    }
}

struct SearchView: View {
    @StateObject var locationManager : LocationManager = .init()
    @State var searchText = ""
    @State var presentNavigationView: Bool = false
    @State var navigationTag: String?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack{
            VStack{
                Text("Hi [user’s name],")
                    .foregroundColor(Color("Black200"))
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                Text("where do you reside?")
                    .font(.custom("SFProDisplay-Regular", size: 34))
                    .frame(maxWidth: 355, alignment: .leading)
                
            }
            Button{
                // MARK: Navigating To MapView
                if #available(iOS 16, *){
                    presentNavigationView.toggle()
                }else{
                    navigationTag = "MAPVIEW"
                }
            } label: {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    if let place = locationManager.pickedPlaceMark{
                        VStack(alignment: .leading) {
                            Text(locationManager.pickedPlaceMark?.name ?? "")
                                .font(.title3.bold())
                            
                            Text(locationManager.pickedPlaceMark?.locality ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                    } else {
                        Text("home address")
                            .font(.custom("SFProDisplay-Regular", size: 17))
                            .foregroundColor(.gray)
                            .padding(.trailing, 12.0)
                            .frame(maxWidth: 250, alignment: .leading)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 0)
                .frame(width: 358, height: 56, alignment: .leading)
                .cornerRadius(999)
                .overlay(
                    RoundedRectangle(cornerRadius: 999)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.82, green: 0.83, blue: 0.85), lineWidth: 1)
                )
            }
            Spacer()
            
            Button{
                
            }
        label: {
            HStack{
                Text("Next")
                    .font(.custom("SFProText-Regular", size: 17))
                    .foregroundColor(.white)
                Image(systemName: "arrow.up.forward")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 358, maxHeight: 64)
            .background(Color("Redish400"))
            .cornerRadius(50)
            
        }
            
            
        }
        .background{
            if #available(iOS 16, *){
                Rectangle()
                    .foregroundColor(.clear)
                    .navigationDestination(isPresented: $presentNavigationView, destination: {
                        InformationLocationSearchView()
                            .environmentObject(locationManager)
                            .toolbar(.hidden, for: .navigationBar)
                    })
            }else{
                NavigationLink(tag: "MAPVIEW", selection: $navigationTag) {
                    InformationLocationSearchView()
                        .environmentObject(locationManager)
                        .navigationBarHidden(true)
                } label: {}
                    .labelsHidden()
            }
        }
    }
}
