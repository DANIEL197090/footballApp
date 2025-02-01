//
//  CompetitionOverViewCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//


import UIKit
class TableCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static var identifier = "tableCell"
    
    let standingstableView = UITableView()
  
    func setUpTableView() {
        // Setup table view
        standingstableView.delegate = self
        standingstableView.dataSource = self
        standingstableView.rowHeight = 50
        standingstableView.separatorColor = .gray
        // Enable Auto Layout
        standingstableView.translatesAutoresizingMaskIntoConstraints = false
        standingstableView.backgroundColor =  .systemBackground
        standingstableView.register(StandingsCell.self, forCellReuseIdentifier: StandingsCell.identifier)
        standingstableView.translatesAutoresizingMaskIntoConstraints = false
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTableView()
        backgroundColor = .yellow
        
        contentView.addSubview(standingstableView)
        
        // Anchor collectionView to top, bottom, left, and right of contentView
        NSLayoutConstraint.activate([
            standingstableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            standingstableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            standingstableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            standingstableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StandingsCell.identifier, for: indexPath) as! StandingsCell
        cell.configure(withTitle: "\(indexPath.row). Mancity", numberScores: " 20  20  20  20")
        return cell
    }
}
