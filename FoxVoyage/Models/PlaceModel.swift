//
//  PlaceModel.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import Foundation

struct PlaceModel: Codable {
    let id: Int
        let longitude: String
        let latitude: String
        let name: String
        let tag: String
        let address: String
        let district: String
        let operationalHour: String
        let desc: String
        let activities: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case longitude = "Longitude"
        case latitude = "Latitude"
        case name = "Nama"
        case tag = "Class"
        case address = "Address"
        case district = "Disctrict"
        case operationalHour = "Operational Hour"
        case desc = "Desc."
        case activities = "Activity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.name = try container.decode(String.self, forKey: .name)
        self.tag = try container.decode(String.self, forKey: .tag)
        self.address = try container.decode(String.self, forKey: .address)
        self.district = try container.decode(String.self, forKey: .district)
        self.operationalHour = try container.decode(String.self, forKey: .operationalHour)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.activities = try container.decode(String.self, forKey: .activities)
    }
    
}


