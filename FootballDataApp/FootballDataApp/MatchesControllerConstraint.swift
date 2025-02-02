//
//  MatchControllerConstraint.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
extension  MatchesViewController {
    func setupViews() {
        view.addSubview(matchesTableView)
        NSLayoutConstraint.activate([
            matchesTableView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 0),
            matchesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            matchesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            matchesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
