//
//  InformationViewModel.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 29/07/23.
//

import Foundation

@MainActor final class InformationViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var searchText = ""
    @Published var locations = []
    @Published var isNavigateToInformationLocationView = false
    @Published var presentNavigationView: Bool = false
    @Published var navigationTag: String?
}

