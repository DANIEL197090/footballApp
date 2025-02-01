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
    init(playersList: [Player]) {
        self.playersList = playersList
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
    lazy var clubImageView:  UIImageView  = {
        let imageView =  UIImageView.customImage(image: UIImage(named: "matchesIcon")!)
        imageView.layer.masksToBounds = true
       
        imageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
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
        playersTableView.reloadData()
    }
}
