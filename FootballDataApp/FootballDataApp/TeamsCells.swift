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
        backgroundColor = .red
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(BoxCell.self, forCellWithReuseIdentifier: BoxCell.identifier)
        
        contentView.addSubview(collectionView)
        
        // Enable Auto Layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Anchor collectionView to top, bottom, left, and right of contentView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -57),
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxCell.identifier, for: indexPath) as! BoxCell
        cell.configure(with: "\(sampleData[indexPath.item])")
        return cell
    }
    
    // MARK: - CollectionView Delegate FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 5// 8pt spacing * 2 (between 3 columns)
        let itemWidth = (collectionView.frame.width) / 3 - 5
        return CGSize(width: itemWidth, height: 150) // Square boxes
    }
}

// MARK: - BoxCell (Each Box in the Grid)
class BoxCell: UICollectionViewCell {
    static var identifier = "boxCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        contentView.addSubview(label)
        
        // Enable Auto Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Center label within the cell
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        label.text = text
    }
}
