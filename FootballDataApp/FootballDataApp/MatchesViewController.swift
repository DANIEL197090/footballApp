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
        setupNavigationBar()
        todayFixturesViewModel.delegate  = self
        setUpTableView()
        getTodayFixtures()
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Today's Fixtures"
        titleLabel.font = UIFont(name: AppFonts.montserratBold.font, size: 16)
        titleLabel.textColor = .label
        
        let titleView = UIView()
        titleView.backgroundColor = .red
        titleView.addSubview(titleLabel)

        // Adjust the label's position within the view
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 0)
        ])

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
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
    override func viewWillAppear(_ animated: Bool) {
                self.navigationController?.isNavigationBarHidden = false
                navigationController?.navigationBar.backgroundColor = .clear
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    func getTodayFixtures() {
        if InternetConnectionManager.isConnectedToNetwork(){
            matchesTableView.isHidden = true
            todayFixturesViewModel.getTodayFixtures()
        } else {
            Toast.shared.showToastWithTItle("\(showNoInternetConnectionHeader()), \(showNoInternetConnection())", type: .error)
        }
    }
}
