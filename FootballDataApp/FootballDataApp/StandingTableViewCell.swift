//
//  StandingTableViewCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class StandingsCell: UITableViewCell {
    static var identifier = "standingsCell"
    lazy var clubNameLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .left, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var numbersScoresLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .right, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var labelStack: UIStackView = {
        let stackView = UIStackView.customHorizontalStackView(distribution: .fillEqually, views: [clubNameLabel, numbersScoresLabel], spacing: 0)
        stackView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return stackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         // Configure title label
        contentView.addSubViews(labelStack)
        NSLayoutConstraint.activate([
            labelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(withTitle: String, numberScores: String) {
        clubNameLabel.text = withTitle
        numbersScoresLabel.text = numberScores
    }
}
