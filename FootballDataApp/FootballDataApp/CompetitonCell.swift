//
//  CompetitonCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
class CompetitionCell: UITableViewCell {
    static var identifier = "competitionCell"
    lazy var titleLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         // Configure title label
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(withTitle: String) {
        titleLabel.text = withTitle
    }
}
