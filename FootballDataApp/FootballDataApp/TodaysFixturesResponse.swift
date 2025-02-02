//
//  TodaysFixturesResponse.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
// MARK: - Root Model
struct TodayMatchesResponse: Codable {
    let filters: TodayFilters
    let resultSet: ResultSet
    let matches: [TodayMatches]
}

// MARK: - Filters
struct TodayFilters: Codable {
    let dateFrom: String
    let dateTo: String
    let permission: String
}

// MARK: - ResultSet
struct ResultSet: Codable {
    let count: Int
    let competitions: String
    let first: String
    let last: String
    let played: Int
}

// MARK: - Match
struct TodayMatches: Codable {
    let area: TodayArea?
    let competition: TodayCompetition
    let season: Season
    let id: Int
    let utcDate: String
    let status: String
    let matchday: Int
    let stage: String
    let group: String?
    let lastUpdated: String
    let homeTeam: Team
    let awayTeam: Team
    let score: Score
}

// MARK: - Area
struct TodayArea: Codable {
    let id: Int
    let name: String
    let code: String
    let flag: String
}

// MARK: - Competition
struct TodayCompetition: Codable {
    let id: Int
    let name: String
    let code: String
    let type: String
    let emblem: String
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int
    let winner: String?
}

// MARK: - Team
struct TodayTeam: Codable {
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crest: String
}

// MARK: - Score
struct Score: Codable {
    let winner: String?
    let duration: String
    let fullTime: MatchScore
    let halfTime: MatchScore
}

// MARK: - MatchScore
struct MatchScore: Codable {
    let home: Int?
    let away: Int?
}

