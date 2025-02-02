//
//  MatchesViewController.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/30/25.
//
import UIKit
class MatchesViewController: BaseViewController {
    let matchesTableView = UITableView()
    var todayFixtures : [TodayMatches] = []
    var todayFixturesViewModel = TodayFixturesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        todayFixturesViewModel.delegate  = self
        setUpTableView()
        getTodayFixtures()
    }
 
    func setUpTableView() {
        // Setup table view
        matchesTableView.delegate = self
        matchesTableView.dataSource = self
        matchesTableView.rowHeight = 100
        matchesTableView.separatorColor = .gray
        matchesTableView.backgroundColor =  .systemBackground
        matchesTableView.register(MatchesCell.self, forCellReuseIdentifier: MatchesCell.identifier)
        matchesTableView.translatesAutoresizingMaskIntoConstraints = false
    }
  
    func getTodayFixtures() {
        if InternetConnectionManager.isConnectedToNetwork(){
            matchesTableView.isHidden = true
            todayFixturesViewModel.getTodayFixtures()
            DispatchQueue.main.async {
                Loader.shared.showLoader()
            }
        } else {
            Toast.shared.showToastWithTItle("\(showNoInternetConnectionHeader()), \(showNoInternetConnection())", type: .error)
        }
    }
    
}
