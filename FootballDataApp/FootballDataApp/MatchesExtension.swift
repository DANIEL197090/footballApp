//
//  MatchesExtension.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
extension MatchesViewController:TodayFixturesViewModelDelegate {
    func didReceiveTodayFixturessResponse(response: TodayMatchesResponse?, statusCode: Int) {
        if statusCode == 200 {
            Loader.shared.hideLoader()
            matchesTableView.isHidden = false
            todayFixtures = response?.matches ?? []
            DispatchQueue.main.async {
                self.matchesTableView.reloadData()
            }
           
        }
        if statusCode == 400 {
            Loader.shared.hideLoader()
            Toast.shared.showToastWithTItle("No matches found", type: .error)
        }
    }
    
}
