//
//  BaseViewController.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        // Enable large titles
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
                self.navigationController?.isNavigationBarHidden = true
                navigationController?.navigationBar.backgroundColor = .clear
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}
