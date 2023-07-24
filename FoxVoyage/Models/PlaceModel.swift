//
//  PlaceModel.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import Foundation
import SwiftUI

struct PlaceModel : Equatable, Identifiable{
    let id: String
    let name : String
    let imageName1: String
    let imageName2: String
    let tag: String
    let totalMission: Int
    let totalDistance: Double
    let color: String
    
    
    init(id: String, name: String, imageName1: String, imageName2: String, tag: String, totalMission: Int, totalDistance: Double, color: String) {
        self.id = id
        self.name = name
        self.imageName1 = imageName1
        self.imageName2 = imageName2
        self.tag = tag
        self.totalMission = totalMission
        self.totalDistance = totalDistance
        self.color = color
    }
    
}
