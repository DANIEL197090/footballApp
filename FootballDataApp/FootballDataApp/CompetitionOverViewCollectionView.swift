//
//  CompetitionOverViewCollectionView.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
extension CompetitionOverViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell =   competitionOverViewCollectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell =   competitionOverViewCollectionView.dequeueReusableCell(withReuseIdentifier: FixturesCell.identifier, for: indexPath) as? FixturesCell else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell =   competitionOverViewCollectionView.dequeueReusableCell(withReuseIdentifier: TeamsCell.identifier, for: indexPath) as? TeamsCell else { return UICollectionViewCell() }
            return cell
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width , height: view.frame.height)
        }
        
    }

