//
//  MatchesControllerTableView.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
extension MatchesViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchesCell.identifier, for: indexPath) as! MatchesCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = CompetitionOverViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    // MARK: - Custom Header View
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = backgroundSystemColor // Set background color
            
            let titleLabel = UILabel()
            titleLabel.text = "Today's Fixtures"
            titleLabel.font = UIFont(name: AppFonts.montserratBold.font, size: 20)
            titleLabel.textColor = appTextColor
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(titleLabel)
            
            // Constraints to align title to the left with padding
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
            
            return headerView
        }
        
        // MARK: - Set Header Height
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50 // Adjust height as needed
        }
}
