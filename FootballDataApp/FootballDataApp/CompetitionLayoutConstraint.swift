//
//  CompetitionLayoutConstraint.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import UIKit
extension CompetitionViewController {
    func setupViews() {
        view.addSubview(competitiontableView)
        NSLayoutConstraint.activate([
            competitiontableView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 0),
            competitiontableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            competitiontableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            competitiontableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
