//
//  HomeViewController.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    private var item: [CellSelection] = [
        .stories([
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!),
        StoriesModel(name: "dog", image: UIImage(named: "dog")!)
        ]),
        
        .post(PostModel(userImage: UIImage(named: "dog")!, userName: "Some_dog", subTitle: "Sponsored", postImage: UIImage(named: "postImage")!, numberOfLikes: 100, comment: Comment(userName: "Another_dog", commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world"))),
        .post(PostModel(userImage: UIImage(named: "dog")!, userName: "Some_dog", subTitle: "Sponsored", postImage: UIImage(named: "postImage")!, numberOfLikes: 100, comment: Comment(userName: "Another_dog", commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world"))),
        .post(PostModel(userImage: UIImage(named: "dog")!, userName: "Some_dog", subTitle: "Sponsored", postImage: UIImage(named: "postImage")!, numberOfLikes: 100, comment: Comment(userName: "Another_dog", commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world"))),
        .post(PostModel(userImage: UIImage(named: "dog")!, userName: "Some_dog", subTitle: "Sponsored", postImage: UIImage(named: "postImage")!, numberOfLikes: 100, comment: Comment(userName: "Another_dog", commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world")))
    ]
    
    private var tableView = UITableView()
    
    // MARK: - Life cycle
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
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = item[indexPath.row]
        
        switch item {
        case .stories(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as? StoriesCell else { return UITableViewCell()}
            cell.configure(with: info)
            return cell
            
        case .post(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell else { return UITableViewCell() }
            
            cell.configure(with: info)
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height / 8
        } else {
            return UITableView.automaticDimension
        }
    }
}
