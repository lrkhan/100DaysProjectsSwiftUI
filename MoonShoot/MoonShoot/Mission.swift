//
//  Mission.swift
//  MoonShoot
//
//  Created by Luthfor Khan on 12/21/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var launchFormated: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "DNE"
    }
}
