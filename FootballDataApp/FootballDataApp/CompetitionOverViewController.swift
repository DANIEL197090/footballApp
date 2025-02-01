//
//  CompetitionOverViewController.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
class CompetitionOverViewController: BaseViewController {
    lazy var backButton: UIButton = {
        let button = UIButton.backButtonDesign()
        button.addTarget(self, action: #selector(didtapOnBackButton), for: .touchUpInside)
        return button
    }()
    lazy var topView: UIView = {
        let view =  UIView.viewDesign(cornerRadius: 0, backgroundColor: .blue)
        view.isUserInteractionEnabled = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    lazy var headerView: UIView = {
        let view =  UIView.viewDesign(cornerRadius: 0, backgroundColor: .systemBackground)
        view.isUserInteractionEnabled = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.layer.shadowColor = AppColors.shadowColor.color.cgColor
        view.layer.shadowOpacity = 0.09
        view.layer.shadowOffset = CGSize(width: 0, height: 0)  // Shadow around the entire view
        view.layer.shadowRadius = 4.0  // Adjust this for shadow spread
        return view
    }()
    lazy var viewStack: UIStackView = {
        let stackView = UIStackView.customVerticalStackView(distribution: .fill, views: [topView, headerView], spacing: 0)
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    lazy var tableButton: UIButton = {
        let button = UIButton.plainButtonDesign(withText: "Table", backgroundColor: UIColor.clear, titleColor: .gray, borderWidth: 0, buttonRadius: 0, buttonFontFamily: AppFonts.montserratRegular.font, buttonFontSize: 16, buttonHeight: 30)
        button.addTarget(self, action: #selector(didtapOnTableButton), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        return button
    }()
    @objc func didtapOnTableButton() {
        tableButton.setTitleColor(appTextColor, for: .normal)
        fixturesButton.setTitleColor(.gray, for: .normal)
        teamButton.setTitleColor(.gray, for: .normal)
    }
    lazy var fixturesButton: UIButton = {
        let button = UIButton.plainButtonDesign(withText: "Fixtures", backgroundColor: UIColor.clear, titleColor: .gray, borderWidth: 0, buttonRadius: 0, buttonFontFamily: AppFonts.montserratRegular.font, buttonFontSize: 16, buttonHeight: 30)
        button.addTarget(self, action: #selector(didtapOnFixturesButton), for: .touchUpInside)
        return button
    }()
    @objc func didtapOnFixturesButton() {
        tableButton.setTitleColor(.gray, for: .normal)
        fixturesButton.setTitleColor(appTextColor, for: .normal)
        teamButton.setTitleColor(.gray, for: .normal)
    }
    lazy var teamButton: UIButton = {
        let button = UIButton.plainButtonDesign(withText: "Teams", backgroundColor: UIColor.clear, titleColor: .gray, borderWidth: 0, buttonRadius: 0, buttonFontFamily: AppFonts.montserratRegular.font, buttonFontSize: 16, buttonHeight: 30)
        button.addTarget(self, action: #selector(didtapOnTeamButton), for: .touchUpInside)
        button.contentHorizontalAlignment = .trailing
        return button
    }()
    @objc func didtapOnTeamButton() {
        tableButton.setTitleColor(.gray, for: .normal)
        fixturesButton.setTitleColor(.gray, for: .normal)
        teamButton.setTitleColor(appTextColor, for: .normal)
    }
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView.customHorizontalStackView(distribution: .fillEqually, views: [tableButton, fixturesButton, teamButton], spacing: 0)
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    @objc func didtapOnBackButton() {
        pop(numberOfTimes: 1)
    }
    lazy var competitionOverCollectionView: UICollectionView = {
        return createCustomCollectionView(
            dataSource: self,
            delegate: self,
            scrollDirection: .horizontal,
            minimumLineSpacing: 16,
            isScrollEnabled: true,
            showsVerticalScrollIndicator: false,
            showsHorizontalScrollIndicator: false,
            backgroundColor: .clear
        )
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       setupViews()
    }
}


