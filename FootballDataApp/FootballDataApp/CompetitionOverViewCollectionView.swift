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
            cell.teamStanding = standings
            return cell
        case 1:
            guard let cell =   competitionOverViewCollectionView.dequeueReusableCell(withReuseIdentifier: FixturesCell.identifier, for: indexPath) as? FixturesCell else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell =   competitionOverViewCollectionView.dequeueReusableCell(withReuseIdentifier: TeamsCell.identifier, for: indexPath) as? TeamsCell else { return UICollectionViewCell() }
            cell.teamList = teamList
            cell.delegate = self
            return cell
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width , height: view.frame.height)
        }
        
    }

extension CompetitionOverViewController : TeamCellDelegate {
    func didSelectEachTeam(clubName: String, clubImage: String, parentIndex: Int, playersList: [Player]) {
        print("Clicked on \(playersList) inside Parent Index \(parentIndex)")
        let controller = PlayersViewController(playersList: playersList, clubImage: clubImage, clubName: clubName)
        let sheetController = createSheetViewController(with: controller, sizes: [.fixed(600), .fixed(800)])
        self.present(sheetController, animated: false)
    }
}
