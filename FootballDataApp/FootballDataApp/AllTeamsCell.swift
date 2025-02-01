//
//  AllTeamsCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class AllTeamsCell: UICollectionViewCell {
    static var identifier = "AllTeamsCell"
    lazy var clubImageView:  UIImageView  = {
        let imageView =  UIImageView.customImage(image: UIImage(named: "matchesIcon")!)
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    lazy var clubNameLabel: UILabel = {
        let label = UILabel.customLabel(text: "", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        label.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return label
    }()
    lazy var detailsStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fill, views: [clubImageView, clubNameLabel], spacing: 0)
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubViews(detailsStack)
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = .systemBackground
        contentView.layer.shadowColor = AppColors.shadowColor.color.cgColor
        contentView.layer.shadowOpacity = 0.09
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)  // Shadow around the entire view
        contentView.layer.shadowRadius = 4.0  // Adjust this for shadow spread
        // Center label within the cell
        NSLayoutConstraint.activate([
            detailsStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailsStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            detailsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        clubNameLabel.text = text
    }
}
