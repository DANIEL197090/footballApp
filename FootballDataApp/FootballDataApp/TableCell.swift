//
//  CompetitionOverViewCell.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//


import UIKit
class TableCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    var teamStanding: [TeamStanding] = [] {
        didSet {
            standingstableView.reloadData()
        }
    }
    
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
        backgroundColor = backgroundSystemColor
        
        contentView.addSubview(standingstableView)
        
        // Anchor collectionView to top, bottom, left, and right of contentView
        NSLayoutConstraint.activate([
            standingstableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            standingstableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            standingstableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            standingstableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  teamStanding.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StandingsCell.identifier, for: indexPath) as! StandingsCell
        let standingDetails = teamStanding[indexPath.row]
        cell.configure(clubLogo: "\(standingDetails.team.crest)", clubName: "\(standingDetails.team.shortName)", standings: "\(standingDetails.playedGames)  \(standingDetails.won)  \(standingDetails.lost)  \(standingDetails.draw)  \(standingDetails.points)")
        cell.clubPostionLabel.text = "\(indexPath.row + 1)."
        return cell
    }
    
    // MARK: - Custom Header View
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = backgroundSystemColor // Set background color
            
            let titleLabel = UILabel()
            titleLabel.text = "Standings"
            titleLabel.font = UIFont(name: AppFonts.montserratBold.font, size: 13)
            titleLabel.textColor = appTextColor
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            
            let detailsLabel = UILabel()
            detailsLabel.text = "P  W  L  D  PTS"
            detailsLabel.font = UIFont(name: AppFonts.montserratBold.font, size: 13)
            detailsLabel.textColor = appTextColor
            detailsLabel.translatesAutoresizingMaskIntoConstraints = false
            detailsLabel.textAlignment = .right
            headerView.addSubViews(detailsLabel,titleLabel)
            
            // Constraints to align title to the left with padding
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                
                detailsLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                detailsLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
            
            return headerView
        }
        
        // MARK: - Set Header Height
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50 // Adjust height as needed
        }
}
