//
//  ContentView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            do {
                guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
                    print("Error: File not found.")
                    return
                }
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let placeModels = try decoder.decode([PlaceModel].self, from: data)
                
                // Now you have an array of PlaceModel objects to use in SwiftUI.
                // You can pass this array to your SwiftUI view or use it within the view as needed.
                print(placeModels)
            } catch {
                print("Error reading or decoding JSON: \(error)")
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
