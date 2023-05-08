//
//  HomeViewController.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializing()
    }
}

// MARK: - Private methods
private extension HomeViewController {
    func initializing() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationController?.navigationBar.tintColor = UIColor(named: "TabBarItemColor")
        
        navigationItem.leftBarButtonItems = leftBarBatonItems()
        navigationItem.rightBarButtonItems = rightBarButtonItems()
    }
    
    func leftBarBatonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: InstagramLogo())
        let dropDownMenuItem = UIBarButtonItem(title: "", image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: nil)
        return [logoBarButtonItem, dropDownMenuItem]
    }
    
    func rightBarButtonItems() -> [UIBarButtonItem] {
        let heartBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "heart"), primaryAction: nil, menu: nil)
        let planeBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "paperplane"), primaryAction: nil, menu: nil)
        return [planeBarButtonItem, heartBarButtonItem]
    }
}
