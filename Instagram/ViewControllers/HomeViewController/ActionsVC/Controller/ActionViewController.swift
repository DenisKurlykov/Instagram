//
//  ActionViewController.swift
//  Instagram
//
//  Created by Денис Курлыков on 28.05.2023.
//

import UIKit

final class ActionViewController: UIViewController {
    
    
    // MARK: Private properties
    private let itemToday = [
        Model(userImage: "postImage", userName: "user_231", infoMessage: "подписался на ваши обновления", image: "postImage", subscribe: nil),
        Model(userImage: "postImage", userName: "user_231", infoMessage: "понравилась ваша публикация", image: nil, subscribe: false),
        Model(userImage: "postImage", userName: "user_231", infoMessage: "подписался на ваши обновления", image: nil, subscribe: true)
    ]
    
    private let itemYesterday = [
        Model(userImage: "dog", userName: "user_231", infoMessage: "подписался на ваши обновления", image: nil, subscribe: true),
        Model(userImage: "dog", userName: "user_231", infoMessage: "подписался на ваши обновления", image: nil, subscribe: false),
        Model(userImage: "dog", userName: "user_231", infoMessage: "понравилась ваша публикация", image: "postImage", subscribe: nil),
        Model(userImage: "dog", userName: "user_231", infoMessage: "понравилась ваша публикация", image: "postImage", subscribe: nil),
        Model(userImage: "dog", userName: "user_231", infoMessage: "подписался на ваши обновления", image: nil, subscribe: false),
        Model(userImage: "dog", userName: "user_231", infoMessage: "подписался на ваши обновления", image: nil, subscribe: false)
    ]
    
    private var tableView = UITableView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializing()
    }
}

// MARK: - Private methods
private extension ActionViewController {
    func initializing() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        setupNavigationBar()
        setupTableView()
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.backButtonTitle = "Уведомления"
    }
    
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.separatorStyle = .none
        tableView.register(ActionsCellTableViewCell.self, forCellReuseIdentifier: ActionsCellTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource
extension ActionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionsModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return itemToday.count
        default:
            return itemYesterday.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ActionsCellTableViewCell.identifier, for: indexPath) as? ActionsCellTableViewCell else { return UITableViewCell()}
            cell.configure(with: itemToday[indexPath.row])
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ActionsCellTableViewCell.identifier, for: indexPath) as? ActionsCellTableViewCell else { return UITableViewCell()}
            cell.configure(with: itemYesterday[indexPath.row])
            return cell
        }
    }
}

extension ActionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        
        switch section {
        case 0:
            view.configureLabel(textLabel: "Сегодня")
            return view
        default:
            view.configureLabel(textLabel: "Вчера")
            return view
        }
    }
}
