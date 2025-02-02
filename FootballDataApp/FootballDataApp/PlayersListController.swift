//
//  PlayersListController.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class PlayersViewController: BaseViewController {
    let playersTableView = UITableView()
    var playersList: [Player] = []
    var clubImage: String
    var clubName: String
    init(playersList: [Player], clubImage: String, clubName: String) {
        self.playersList = playersList
        self.clubImage = clubImage
        self.clubName = clubName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var cancelButton: UIButton = {
        let button = UIButton.cancelButtonDesign()
        button.addTarget(self, action: #selector(didTapOnCancelButton), for: .touchUpInside)
        return button
    }()
    lazy var clubNameLabel: UILabel = {
        let label = UILabel.customLabel(text: clubName, fontSize: 16, fontFamily: AppFonts.montserratBold.font, textAlignment: .center, numberofLines: 0, textColor: appTextColor)
        return label
    }()
    lazy var clubImageView:  UIImageView  = {
        let imageView =  UIImageView.customImage(image: UIImage(named: "matchesIcon")!)
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    @objc func didTapOnCancelButton() {
        dismiss(animated: true)
    }
    func setUpTableView() {
        // Setup table view
        playersTableView.delegate = self
        playersTableView.dataSource = self
        playersTableView.rowHeight = 50
        playersTableView.separatorColor = .gray
        playersTableView.backgroundColor =  .systemBackground
        playersTableView.register(PlayerListCell.self, forCellReuseIdentifier: PlayerListCell.identifier)
        playersTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidLoad() {
        setupView()
        setUpTableView()
        DispatchQueue.main.async {
            self.playersTableView.reloadData()
            self.clubImageView.sd_setImage(with: URL(string: self.clubImage), placeholderImage: UIImage(named: "matchesIcon"))
        }
    }
}
