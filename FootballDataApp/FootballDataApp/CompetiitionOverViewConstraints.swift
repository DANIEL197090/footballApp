//
//  CompetiitionOverViewConstraints.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
extension CompetitionOverViewController {
    func setupViews() {
        view.addSubViews(viewStack)
        topView.addSubview(backButton)
        headerView.addSubview(buttonStack)
        NSLayoutConstraint.activate([
            viewStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
          
            
            backButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 65),
            backButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: appLeadingConstraint - 2),
            
            buttonStack.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            buttonStack.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: appLeadingConstraint),
            buttonStack.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: appTrailingConstraint),
        ])
    }
}
