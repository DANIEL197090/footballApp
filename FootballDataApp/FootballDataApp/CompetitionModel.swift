//
//  CompetitionModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
// MARK: - Root Response Model
struct CompetitionsResponse: Codable {
    let count: Int
    let filters: Filters
    let competitions: [Competition]
}

// MARK: - Filters Model (Empty for now, you can update as needed)
struct Filters: Codable {
    // Currently empty, but can be updated with properties if needed
}

// MARK: - Competition Model
struct Competition: Codable {
    let id: Int
    let area: Area
    let name: String
    let code: String
    let type: String
    let emblem: String?
    let plan: String
    let currentSeason: CurrentSeason
    let numberOfAvailableSeasons: Int
    let lastUpdated: String
}

// MARK: - Area Model
struct Area: Codable {
    let id: Int
    let name: String
    let code: String
    let flag: String?
}

// MARK: - Current Season Model
struct CurrentSeason: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int?
    let winner: String?
}
