//
//  CompetitionStandingsViewModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
protocol CompetitionsStandingsViewModelDelegate: AnyObject {
    func didReceiveCompetitionsStandingsResponse(response: StandingsResponse?, statusCode: Int)
}
class  CompetitionsStandingsViewModel {
    weak var delegate:  CompetitionsStandingsViewModelDelegate?
    func getAllCompetitionsStandings(name: String) {
        let resource =  CompetitionsStandingsResource()
        resource.getResponse(competitionName: name) { result, statusCode in
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
