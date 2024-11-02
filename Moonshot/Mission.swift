//
//  Mission.swift
//  Moonshot
//
//  Created by Syrene Haber Bartolome on 2024/11/02.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
