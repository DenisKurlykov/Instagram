//
//  TabBarController.swift
//  Instagram
//
//  Created by Денис Курлыков on 07.05.2023.
//

import UIKit

class TabBarController: UITabBarController {
   
    // MARK: - Constants
    private enum Controllers {
        static let homeVC = HomeViewController()
        static let searchVC = SearchViewController()
        static let addPublicationVC = AddPublicationViewController()
        static let realsVC = RealsViewController()
        static let accountVC = AccountViewController()
    }
    
    private enum Icons {
        static let home = UIImage(systemName: "house")
        static let search = UIImage(systemName: "magnifyingglass")
        static let addPublication = UIImage(systemName: "plus.app")
        static let reals = UIImage(systemName: "play.square")
        static let account = UIImage(systemName: "person.circle")
    }
    
    private enum SelectedIcons {
        static let home = UIImage(systemName: "house.fill")
        static let search = UIImage(systemName: "magnifyingglass")
        static let reals = UIImage(systemName: "play.square.fill")
        static let account = UIImage(systemName: "person.circle.fill")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Private methods
    private func setupTabBar() {
        let homeNavVC = UINavigationController(rootViewController: Controllers.homeVC)
        
        homeNavVC.tabBarItem = UITabBarItem(title: "", image: Icons.home, selectedImage: SelectedIcons.home)
        Controllers.searchVC.tabBarItem = UITabBarItem(title: "", image: Icons.search, selectedImage: SelectedIcons.search)
        Controllers.addPublicationVC.tabBarItem = UITabBarItem(title: "", image: Icons.addPublication, tag: 2)
        Controllers.realsVC.tabBarItem = UITabBarItem(title: "", image: Icons.reals, selectedImage: SelectedIcons.reals)
        Controllers.accountVC.tabBarItem = UITabBarItem(title: "", image: Icons.account, selectedImage: SelectedIcons.account)
        
        Controllers.homeVC.tabBarItem.tag = 0
        Controllers.searchVC.tabBarItem.tag = 1
        Controllers.addPublicationVC.tabBarItem.tag = 2
        Controllers.realsVC.tabBarItem.tag = 3
        Controllers.accountVC.tabBarItem.tag = 4
        
        viewControllers = [homeNavVC,
                           Controllers.searchVC,
                           Controllers.addPublicationVC,
                           Controllers.realsVC,
                           Controllers.accountVC]
        
        tabBar.backgroundColor = UIColor(named: "BackgroundColor")
        
        tabBar.tintColor = UIColor(named: "TabBarItemColor")
        tabBar.unselectedItemTintColor = UIColor(named: "TabBarItemColor")
        
        selectedIndex = 0
    }
}

