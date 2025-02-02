//
//  CompetitionController.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/30/25.
//

import UIKit

class CompetitionViewController: BaseViewController {
    let competitiontableView = UITableView()
    let competitionsViewModel = CompetitionsViewModel()
    var competitions: [Competition] = []
    
    func setUpTableView() {
        // Setup table view
        competitiontableView.delegate = self
        competitiontableView.dataSource = self
        competitiontableView.rowHeight = 50
        competitiontableView.separatorColor = .gray
        competitiontableView.backgroundColor =  .systemBackground
        competitiontableView.register(CompetitionCell.self, forCellReuseIdentifier: CompetitionCell.identifier)
        competitiontableView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpTableView()
        competitionsViewModel.delegate = self
        getAllCompetitions()
    }
    func getAllCompetitions() {
        if InternetConnectionManager.isConnectedToNetwork(){
            Loader.shared.showLoader(withText: "Loading, Please wait..")
            competitiontableView.isHidden = true
            competitionsViewModel.getAllCompetitions()
        } else {
            Toast.shared.showToastWithTItle("\(showNoInternetConnectionHeader()), \(showNoInternetConnection())", type: .error)
        }
    }
}
