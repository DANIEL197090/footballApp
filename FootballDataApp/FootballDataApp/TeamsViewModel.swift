//
//  TeamsViewModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
protocol TeamsViewModelDelegate: AnyObject {
    func didReceiveCompetitionsStandingsResponse(response: TeamsResponse?, statusCode: Int)
}
class TeamsViewModel {
    weak var delegate: TeamsViewModelDelegate?
    func getAllTeamsUsingCompetition(code: String) {
        let resource = TeamsResource()
        resource.getResponse(competitionCode: code) { result, statusCode in
            switch statusCode {
            case 200, 201, 400, 401:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveCompetitionsStandingsResponse(response: result, statusCode: statusCode)
                }
            case 404, 500, 502:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveCompetitionsStandingsResponse(response: result, statusCode: statusCode)
                }
            default:
                break
            }
        }
        
    }
}
