//
//  PlayersCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class PlayerListCell: UITableViewCell {
    static var identifier = "playerListCell"
    lazy var playerNameLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .left, numberofLines: 0, textColor: appTextColor)
        label.widthAnchor.constraint(equalToConstant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    
    lazy var playerPositionLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .right, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var playerStack: UIStackView = {
        let stackView = UIStackView.customHorizontalStackView(distribution: .fill, views: [playerNameLabel, playerPositionLabel], spacing: 10)
        stackView.alignment = .leading
        stackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Configure title label
        contentView.addSubViews(playerStack)
        NSLayoutConstraint.activate([
            playerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: appLeadingConstraint),
            playerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: appTrailingConstraint),
            playerStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Player) {
        playerNameLabel.text = data.name
        playerPositionLabel.text = data.position
    }
}
