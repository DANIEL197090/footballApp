//
//  MatchesCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//


import UIKit
class MatchesCell: UITableViewCell {
    static var identifier = "matchesCell"
    lazy var timedLabel: UILabel = {
        let label = UILabel.customLabel(text: "Timed", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel.customLabel(text: "13:00", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var mdLabel: UILabel = {
        let label = UILabel.customLabel(text: "MD 39", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var timedStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fillEqually, views: [timedLabel, timeLabel, mdLabel ], spacing: 0)
        stackView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return stackView
    }()
    lazy var homeTeamLabel: UILabel = {
        let label = UILabel.customLabel(text: "Man City", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var awayTeamLabel: UILabel = {
        let label = UILabel.customLabel(text: "Man UTD", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var teamStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fill, views: [homeTeamLabel, awayTeamLabel], spacing: 0)
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    lazy var homeTeamScoreLabel: UILabel = {
        let label = UILabel.customLabel(text: "0", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var matchTimeLabel: UILabel = {
        let label = UILabel.customLabel(text: "0", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .left, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var awayTeamScoreLabel: UILabel = {
        let label = UILabel.customLabel(text: "0", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var scoreStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fillEqually, views: [homeTeamScoreLabel, matchTimeLabel, awayTeamScoreLabel], spacing: 0)
        stackView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return stackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         // Configure title label
        contentView.addSubViews(timedStack, teamStack, scoreStack)
        NSLayoutConstraint.activate([
            timedStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timedStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timedStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            teamStack.leadingAnchor.constraint(equalTo: timedStack.trailingAnchor, constant: 20),
            teamStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            scoreStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scoreStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            scoreStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(withTitle: String) {
        
    }
}
