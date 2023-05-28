//
//  HomeViewController.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var item: [CellSelection] = [
        .stories([
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: false, visibleAddStoryButton: true),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false),
            StoriesModel(name: "dog", image: UIImage(named: "dog") ?? UIImage(), visibleRingStory: true, visibleAddStoryButton: false)
        ]),
        
        .post(PostModel(userImage: UIImage(named: "dog") ?? UIImage(),
                            userName: "Some_dog",
                            subTitle: "Sponsored",
                            postImage: UIImage(named: "postImage") ?? UIImage(),
                            numberOfLikes: 100,
                            comment: nil)),
        .post(PostModel(userImage: UIImage(named: "dog") ?? UIImage(),
                        userName: "Some_dog",
                        subTitle: "Sponsored",
                        postImage: UIImage(named: "postImage")!,
                        numberOfLikes: 100,
                        comment: Comment(userName: "Another_dog",
                                         commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world"))),
        .post(PostModel(userImage: UIImage(named: "dog") ?? UIImage(),
                        userName: "Some_dog",
                        subTitle: "Sponsored",
                        postImage: UIImage(named: "postImage") ?? UIImage(),
                        numberOfLikes: 100,
                        comment: Comment(userName: "Another_dog",
                                         commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world"))),
        .post(PostModel(userImage: UIImage(named: "dog") ?? UIImage(),
                        userName: "Some_dog",
                        subTitle: "Sponsored",
                        postImage: UIImage(named: "postImage") ?? UIImage(),
                        numberOfLikes: 100,
                        comment: Comment(userName: "Another_dog",
                                         commentText: "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world")))
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
        return [logoBarButtonItem]
    }
    
    func rightBarButtonItems() -> [UIBarButtonItem] {
        let heartBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "heart"), target: self, action: nil)
        let planeBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "paperplane"), target: self, action: nil)
        return [planeBarButtonItem, heartBarButtonItem]
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(StoriesCellTableViewCell.self, forCellReuseIdentifier: StoriesCellTableViewCell.identifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = item[indexPath.row]
        
        switch item {
        case .stories(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCellTableViewCell.identifier, for: indexPath) as? StoriesCellTableViewCell else { return UITableViewCell()}
            cell.configure(with: info)
            return cell
            
        case .post(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell else { return UITableViewCell() }
            cell.configure(with: info)
            return cell
        }
    }
}
