//
//  PlayerListConstraint.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
extension PlayersViewController {
    func setupView() {
        view.addSubViews(cancelButton, clubImageView)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: appTrailingConstraint),
            
            clubImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 15),
            clubImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
           
        ])
       
    }
}
