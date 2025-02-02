//
//  CompetitionExtension.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
extension CompetitionViewController: CompetitionsViewModelDelegate {
    func didReceiveCompetitionsResponse(response: CompetitionsResponse?, statusCode: Int) {
        if statusCode == 200 {
            Loader.shared.hideLoader()
            competitiontableView.isHidden = false
            competitions = response?.competitions ?? []
            DispatchQueue.main.async {
                self.competitiontableView.reloadData()
            }
           
        }
    }
    
}
