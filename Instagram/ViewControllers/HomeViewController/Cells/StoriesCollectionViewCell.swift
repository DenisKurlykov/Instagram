//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 15.05.2023.
//

import UIKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    static let identifier = "storiesCollectionViewCell"
    
    // MARK: - Private properties
    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let ringImageView = UIImageView(image: UIImage(named: "StoryRing"))
    private let addStoriesButton = UIButton(type: .custom)
    
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
        ringImageView.isHidden = !item.visibleRingStory
        addStoriesButton.isHidden = !item.visibleAddStoryButton
    }
}

// MARK: - Private methods
private extension StoriesCollectionViewCell {
    func initialiser() {
        contentView(userImageView,
                    userNameLabel,
                    ringImageView,
                    addStoriesButton)
        
        setupUserImageView()
        setupUserNameLabel()
        setupConstraints()
        setupAddStoriesButton()
    }
    
    func setupUserImageView() {
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    func setupUserNameLabel() {
        userNameLabel.textAlignment = .center
        userNameLabel.font = .systemFont(ofSize: 13)
        userNameLabel.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupAddStoriesButton() {
        addStoriesButton.setImage(UIImage(named: "Button"), for: .normal)
    }
    
    func setupConstraints() {
        disableAutoresizing(userImageView,
                            userNameLabel,
                            ringImageView,
                            addStoriesButton)
        
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            userNameLabel.widthAnchor.constraint(equalTo: userImageView.widthAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 26),
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userNameLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            ringImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            ringImageView.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            ringImageView.widthAnchor.constraint(equalToConstant: 72),
            ringImageView.heightAnchor.constraint(equalTo: ringImageView.widthAnchor),
            
            addStoriesButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            addStoriesButton.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            addStoriesButton.widthAnchor.constraint(equalToConstant: 20),
            addStoriesButton.heightAnchor.constraint(equalTo: addStoriesButton.widthAnchor)
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


