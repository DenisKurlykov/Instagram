//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 15.05.2023.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    static let identifier = "storiesCollectionViewCell"
    
    // MARK: - Private properties
    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialiser()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        initialiser()
        layoutIfNeeded()
        setupUserImageView()
        setupUserNameLabel()
    }
    
    // MARK: - Public methods
    func configure(with item: StoriesModel) {
        userImageView.image = item.image
        userNameLabel.text = item.name
    }
}

// MARK: - Private methods
private extension StoriesCollectionViewCell {
    func initialiser() {
        contentView(userImageView,
                    userNameLabel)
        
        setupUserImageView()
        setupUserNameLabel()
        setupConstraints()
    }
    
    func setupUserImageView() {
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    func setupUserNameLabel() {
        userNameLabel.textAlignment = .center
        userNameLabel.font = .systemFont(ofSize: userNameLabel.frame.height / 2.5)
        userNameLabel.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupConstraints() {
        disableAutoresizing(userImageView,
                            userNameLabel)
        
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            userImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            
            userNameLabel.widthAnchor.constraint(equalTo: userImageView.widthAnchor),
            //userNameLabel.heightAnchor.constraint(equalTo: userNameLabel.widthAnchor, multiplier: 1/2),
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userNameLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0)
        ])
    }
}

// MARK: - Method for add view to superView
private extension StoriesCollectionViewCell {
    func contentView(_ add: UIView...) {
        add.forEach { view in
            contentView.addSubview(view)
        }
    }
}

// MARK: - Method disable autoresizingMask
private extension StoriesCollectionViewCell {
    func disableAutoresizing(_ masks: UIView...) {
        masks.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

