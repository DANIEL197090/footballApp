//
//  FixturesCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class FixturesCell: UICollectionViewCell {
    static var identifier = "fixturesCell"
    lazy var noFixturesView: UIView = {
        let view =  UIView.viewDesign(cornerRadius: 0, backgroundColor: backgroundSystemColor)
        return view
    }()
    lazy var noFixturesImageView: UIImageView = {
        let imageView = UIImageView()
        let originalImage = UIImage(named: "matchesIcon")?.withRenderingMode(.alwaysTemplate)
        imageView.image = originalImage
        imageView.tintColor = .lightGray 
        imageView.layer.masksToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    lazy var noFixturesLabel: UILabel = {
        let label = UILabel.customLabel(text: "No fixtures", fontSize: 14, fontFamily: AppFonts.montserratRegular.font, textAlignment: .center, numberofLines: 0, textColor: .gray)
        return label
    }()
    lazy var retry: UIButton = {
        let label = UIButton.plainButtonDesign(withText: "Retry", backgroundColor: .lightGray, titleColor: appTextColor, borderWidth: 0, buttonRadius: 5, buttonFontFamily: AppFonts.montserratRegular.font, buttonFontSize: 14, buttonHeight: 55)
        return label
    }()
    lazy var noFixturesViewStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fill, views: [noFixturesImageView, noFixturesLabel, retry], spacing: 20)
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = backgroundSystemColor
        setupViews()
    }
    func setupViews() {
        contentView.addSubViews(noFixturesView)
        noFixturesView.addSubview(noFixturesViewStack)
        NSLayoutConstraint.activate([
            noFixturesView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            noFixturesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            noFixturesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            noFixturesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
            noFixturesViewStack.centerXAnchor.constraint(equalTo: noFixturesView.centerXAnchor, constant: 0),
            noFixturesViewStack.centerYAnchor.constraint(equalTo: noFixturesView.centerYAnchor, constant: 0)
        ])
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
