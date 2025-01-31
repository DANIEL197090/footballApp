//
//  CustomNavigation.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import UIKit
class CustomNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.backgroundColor = .clear
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Update the layout of the navigation bar if needed
        self.navigationController?.navigationBar.layoutIfNeeded()
        // Enable the interactive pop gesture
        self.interactivePopGestureRecognizer?.delegate = self
    }
  
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Check if the view controller stack contains only one view controller, then disable the gesture
        return self.viewControllers.count > 1
    }
}
