//
//  TeamsModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
// MARK: - Premier League Data Model
struct TeamsResponse: Codable {
    let count: Int
    let filters: TeamsFilters
    let competition: TeamsCompetition
    let season: TeamsSeason
    let teams: [Teams]
}

// MARK: - Filters
struct TeamsFilters: Codable {
    let season: String
}

// MARK: - Competition
struct TeamsCompetition: Codable {
    let id: Int
    let name: String
    let code: String
    let type: String
    let emblem: String?
}

// MARK: - Season
struct TeamsSeason: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int?
    let winner: String?
}

// MARK: - Team
struct Teams: Codable {
    let area: TeamsArea
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crest: String
    let address: String
    let website: String
    let founded: Int?
    let clubColors: String
    let venue: String
    let runningCompetitions: [TeamsCompetition]
    let coach: Coach
    let squad: [Player]
}

// MARK: - Area
struct TeamsArea: Codable {
    let id: Int
    let name: String
    let code: String
    let flag: String
}

// MARK: - Coach
struct Coach: Codable {
    let id: Int
    let firstName: String?
    let lastName: String
    let name: String
    let dateOfBirth: String
    let nationality: String
    let contract: Contract
}

// MARK: - Contract
struct Contract: Codable {
    let start: String
    let until: String
}

// MARK: - Player
struct Player: Codable {
    let id: Int
    let name: String
    let position: String?
    let dateOfBirth: String?
    let nationality: String
}
