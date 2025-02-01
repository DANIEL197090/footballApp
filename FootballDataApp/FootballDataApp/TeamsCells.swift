//
//  TeamsCells.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
class TeamsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static var identifier = "teamsCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5// Space between columns
        layout.minimumLineSpacing = 5 // Space between rows
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let sampleData = Array(1...9) // Example data (9 items for 3 rows)
    
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
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CollectionView DataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllTeamsCell.identifier, for: indexPath) as! AllTeamsCell
        cell.configure(with: "\(sampleData[indexPath.item])")
        return cell
    }
    
    // MARK: - CollectionView Delegate FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 5// 8pt spacing * 2 (between 3 columns)
        let itemWidth = (collectionView.frame.width) / 3 - totalSpacing
        return CGSize(width: itemWidth, height: 150) // Square boxes
    }
}
