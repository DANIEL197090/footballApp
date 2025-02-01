//
//  CompetitionOverViewExtension.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
extension CompetitionOverViewController: CompetitionsStandingsViewModelDelegate, TeamsViewModelDelegate {
    func didReceiveCompetitionsStandingsResponse(response: TeamsResponse?, statusCode: Int) {
        if statusCode == 200 {
            teamList = response?.teams ?? []
        }
        if statusCode == 400 {
            Toast.shared.showToastWithTItle("No matches found", type: .error)
        }
    }
    
    func didReceiveCompetitionsStandingsResponse(response: StandingsResponse?, statusCode: Int) {
        if statusCode == 200 {
            competitionOverViewCollectionView.isHidden = false
            standings = response?.standings?[0].table ?? []
            DispatchQueue.main.async {
                self.competitionOverViewCollectionView.reloadData()
            }
           
        }
        if statusCode == 400 {
            Toast.shared.showToastWithTItle("No matches found", type: .error)
        }
    }
}
