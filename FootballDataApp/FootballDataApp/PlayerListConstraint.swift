//
//  PlayerListConstraint.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
extension PlayersViewController {
    func setupView() {
        view.addSubViews(cancelButton, clubImageView, playersTableView, clubNameLabel)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: appLeadingConstraint),
            
            clubNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            clubNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            clubImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 10),
            clubImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            playersTableView.topAnchor.constraint(equalTo:  clubImageView.bottomAnchor, constant: 20),
            playersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            playersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            playersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
           
        ])
       
    }
}
