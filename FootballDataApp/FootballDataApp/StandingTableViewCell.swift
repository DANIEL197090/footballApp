//
//  StandingTableViewCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class StandingsCell: UITableViewCell {
    static var identifier = "standingsCell"
    lazy var clubPostionLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .left, numberofLines: 0, textColor: appTextColor)
        label.widthAnchor.constraint(equalToConstant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var clubImageView:  UIImageView  = {
        let imageView =  UIImageView.customImage(image: UIImage(named: "matchesIcon")!)
        imageView.layer.masksToBounds = true
       
        imageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        return imageView
    }()
    lazy var clubNameLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .left, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var clubStack: UIStackView = {
        let stackView = UIStackView.customHorizontalStackView(distribution: .fill, views: [clubPostionLabel, clubImageView, clubNameLabel], spacing: 10)
        stackView.alignment = .leading
        stackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return stackView
    }()
    lazy var numbersScoresLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .right, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var labelStack: UIStackView = {
        let stackView = UIStackView.customHorizontalStackView(distribution: .fillEqually, views: [clubStack, numbersScoresLabel], spacing: 0)
        return stackView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         // Configure title label
        contentView.addSubViews(labelStack)
        NSLayoutConstraint.activate([
            labelStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(clubLogo: String, clubName: String, standings: String) {
        clubNameLabel.text = clubName
        numbersScoresLabel.text = standings
        clubImageView.sd_setImage(with: URL(string: clubLogo), placeholderImage: UIImage(named: "matchesIcon"))
    }
}
