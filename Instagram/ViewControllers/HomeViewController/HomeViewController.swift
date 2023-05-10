//
//  HomeViewController.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var item: [PostImageModel] = [
        PostImageModel(userImage: UIImage(named: "dog")!, userName: "Some_dog", subTitle: "Sponsored", postImage: UIImage(named: "postImage")!, numberOfLikes: 100, comment: Comment(userName: "Another_dog", commentText: "Hello world"))
    ]
    
    private var tableView = UITableView()
    let identifier = "PostCell"
    
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
        
        setupTableView()
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
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(PostCell.self, forCellReuseIdentifier: identifier)
        //tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? PostCell else { return UITableViewCell() }
        
        let item = item[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    
}

