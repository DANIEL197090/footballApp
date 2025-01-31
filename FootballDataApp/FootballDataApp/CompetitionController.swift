//
//  CompetitionController.swift
//  FootballDataApp
//
//  Created by mac on 1/30/25.
//

import UIKit

class CompetitionViewController: BaseViewController {
    let competitiontableView = UITableView()
    func setUpTableView() {
        // Setup table view
        competitiontableView.delegate = self
        competitiontableView.dataSource = self
        competitiontableView.rowHeight = 50
        competitiontableView.separatorColor = backgroundSystemColor
        competitiontableView.backgroundColor =  .systemBackground
        competitiontableView.register(CompetitionCell.self, forCellReuseIdentifier: CompetitionCell.identifier)
        competitiontableView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpTableView()
    }
    
}
