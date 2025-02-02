//
//  CompetitionOverViewModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation

// MARK: - StandingsResponse
struct StandingsResponse: Codable {
    let filters: StandingsFilters?
    let area: StandingsArea?
    let competition: StandingsCompetition?
    let season: StandingsSeason?
    let standings: [Standing]?
    let message: String?
}

// MARK: - Filters
struct StandingsFilters: Codable {
    let season: String
}

// MARK: - Area
struct StandingsArea: Codable {
    let id: Int
    let name: String
    let code: String
    let flag: String?
}

// MARK: - Competition
struct StandingsCompetition: Codable {
    let id: Int
    let name: String
    let code: String
    let type: String
    let emblem: String?
}

// MARK: - Season
struct StandingsSeason: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int?
    let winner: Winner?
}

// MARK: - Standing
struct Standing: Codable {
    let stage: String
    let type: String
    let group: String?
    let table: [TeamStanding]
}

// MARK: - TeamStanding
struct TeamStanding: Codable {
    let position: Int
    let team: Team
    let playedGames: Int
    let form: String?
    let won: Int
    let draw: Int
    let lost: Int
    let points: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crest: String
}
