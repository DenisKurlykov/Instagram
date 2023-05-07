//
//  TabBarController.swift
//  Instagram
//
//  Created by Денис Курлыков on 07.05.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum Controllers {
        static let homeVC = HomeViewController()
        static let searchVC = SearchViewController()
        static let addPublicationVC = AddPublicationViewController()
        static let realsVC = RealsViewController()
        static let accountVC = AccountViewController()
    }
    
    private enum Icons {
        static let iconHomeVC = "house"
        static let iconSearchVC = "magnifyingglass"
        static let iconAddPersonVC = "plus.app"
        static let iconRealsVC = "play.square"
        static let iconAccountVC = "person.circle"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Private methods
    private func setupTabBar() {
        Controllers.homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: Icons.iconHomeVC), tag: 0)
        Controllers.searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: Icons.iconSearchVC), tag: 1)
        Controllers.addPublicationVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: Icons.iconAddPersonVC), tag: 2)
        Controllers.realsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: Icons.iconRealsVC), tag: 3)
        Controllers.accountVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: Icons.iconAccountVC), tag: 4)
        
        viewControllers = [Controllers.homeVC,
                           Controllers.searchVC,
                           Controllers.addPublicationVC,
                           Controllers.realsVC,
                           Controllers.accountVC]
        
        tabBar.backgroundColor = .black
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        
        selectedIndex = 0
    }
}

