//
//  TeamsCells.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
protocol TeamCellDelegate: AnyObject {
    func didSelectEachTeam(clubName: String, clubImage: String, parentIndex: Int, playersList: [Player])
}

class TeamsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: TeamCellDelegate?
    var teamList: [Teams] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    static var identifier = "teamsCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5// Space between columns
        layout.minimumLineSpacing = 5 // Space between rows
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = backgroundSystemColor
        collectionView.register(AllTeamsCell.self, forCellWithReuseIdentifier: AllTeamsCell.identifier)
        
        contentView.addSubview(collectionView)
        
        // Enable Auto Layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Anchor collectionView to top, bottom, left, and right of contentView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CollectionView DataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllTeamsCell.identifier, for: indexPath) as! AllTeamsCell
        let teams = teamList[indexPath.row]
        cell.configure(with: teams)
        return cell
    }
    
    // MARK: - CollectionView Delegate FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 5// 8pt spacing * 2 (between 3 columns)
        let itemWidth = (collectionView.frame.width) / 3 - totalSpacing
        return CGSize(width: itemWidth, height: 150) // Square boxes
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let players = teamList[indexPath.row].squad
        delegate?.didSelectEachTeam(clubName: teamList[indexPath.row].name, clubImage: teamList[indexPath.row].crest, parentIndex: indexPath.item, playersList: players)
        }
}
