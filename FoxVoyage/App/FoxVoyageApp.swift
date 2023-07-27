//
//  FoxVoyageApp.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI

@main
struct FoxVoyageApp: App {
    
    @State private var dataController = DataContoller()
    
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
