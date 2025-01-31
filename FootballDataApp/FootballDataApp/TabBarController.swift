//
//  ViewController.swift
//  FootballDataApp
//
//  Created by mac on 1/30/25.
//

import UIKit
class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the custom tab bar
               let customTabBar = CustomTabBar()
               setValue(customTabBar, forKey: "tabBar")
        // Hide the tab bar's default top border
        tabBar.clipsToBounds = true
        
        // MARK: Create instance of viewControllers
        let matchesController =  CustomNavigationController(rootViewController: MatchesViewController())
        let competitionController =  CustomNavigationController(rootViewController: CompetitionViewController())
        
        // MARK: Assign viewController to tab Bar
 
        self.setViewControllers([matchesController,competitionController], animated: true)
    
        guard let items = self.tabBar.items else { return }
        var images: [String] = []
        
        images = ["matchesIcon", "competitionIcon"]
        
      
        for item in 0...1 {
            if let originalImage = UIImage(named: images[item]) {
                let resizedImage = originalImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 4)) // Adjust the point size as needed
                items[item].image = resizedImage
            }
        }
        // MARK: Changing the tint Color
        self.tabBar.tintColor = .green
        tabBar.backgroundColor =  .systemBackground
        
    }
    
    // MARK: Tab Bar Delegate
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = self.tabBar.items?.firstIndex(of: item)
        performAnimation(imgView: tabBar.subviews[(index ?? 0) + 1])
    }
    
    // MARK: Animation
    func performAnimation(imgView: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            imgView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                imgView.transform = .identity
            })
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   

}
class CustomTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = 100 // Adjust the height as needed
        return newSize
    }
}
