//
//  Astronaut.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Root
struct AstronautsData: Codable {
    let results: [Astronaut]
}

// MARK: - Astronaut
struct Astronaut: Codable {
    let id: Int
    let url: String
    let name: String
    let status, type: Status
    let nationality, bio: String
    let twitter, instagram: String?
    let wiki: String
    let profile_image: String?
    let profile_image_thumbnail: String?
    let lastFlight, firstFlight: Date?
    let date_of_birth : String?

}


enum TypeEnum: String, Codable {
    case active = "Active"
    case government = "Government"
    case retired = "Retired"
}

// MARK: - Status
struct Status: Codable {
    let id: Int
    let name: TypeEnum
}

