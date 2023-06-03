//
//  ActionsCellTableViewCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 28.05.2023.
//

import UIKit

final class ActionsCellTableViewCell: UITableViewCell {
    
    static let identifier = "actionsCell"
    
    // MARK: - Private properties
    private let userImageView = UIImageView()
    private let infoMessageLabel = UILabel()
    private let subscribeButton = SubscribeButton()
    private let likedImageView = UIImageView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        initializing()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        initializing()
        layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        subscribeButton.layer.cornerRadius = 5
    }
    
    // MARK: - Public methods
    func configure(with model: Model) {
        configureUserImageView(with: model)
        configureInfoMessageLabel(with: model)
        subscribeButton.configureSubscribeButton(with: model)
        configureLikedImageView(with: model)
    }
}

// MARK: - Private Methods
private extension ActionsCellTableViewCell {
    func initializing() {
        selectionStyle = .none
        backgroundColor = UIColor(named: "BackgroundColor")
        
        contentView(userImageView,
                    infoMessageLabel,
                    subscribeButton,
                    likedImageView)
        
        setupInfoMessageLabel()
        setupConstraints()
    }
    
    func setupInfoMessageLabel() {
        infoMessageLabel.textColor = UIColor(named: "TabBarItemColor")
        infoMessageLabel.lineBreakMode = .byCharWrapping
        infoMessageLabel.numberOfLines = 0
        infoMessageLabel.textAlignment = .left
    }
    
    func configureUserImageView(with model: Model) {
        userImageView.clipsToBounds = true
        userImageView.image = UIImage(named: model.userImage)
    }
    
    func configureInfoMessageLabel(with model: Model) {
        let string = model.userName + " " + model.infoMessage
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: model.userName.count)
        infoMessageLabel.font = .systemFont(ofSize: 13)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 13), range: range)
        infoMessageLabel.attributedText = attributedString
    }
    
    func configureLikedImageView(with model: Model) {
        if model.image == nil {
            likedImageView.isHidden = true
        }
        guard let image = model.image else { return }
        likedImageView.image = UIImage(named: image)
    }
    
    func setupConstraints() {
        disableAutoresizing(userImageView,
                            infoMessageLabel,
                            subscribeButton,
                            likedImageView)
        
        if subscribeButton.isHidden {
            NSLayoutConstraint.activate([
                infoMessageLabel.trailingAnchor.constraint(equalTo: likedImageView.leadingAnchor, constant: -8)
            ])
        } else {
            NSLayoutConstraint.activate([
                infoMessageLabel.trailingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: -8)
            ])
        }
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            userImageView.heightAnchor.constraint(equalToConstant: 44),
            userImageView.widthAnchor.constraint(equalToConstant: 44),
            
            infoMessageLabel.topAnchor.constraint(equalTo: userImageView.topAnchor),
            infoMessageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),
            
            subscribeButton.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            subscribeButton.leadingAnchor.constraint(equalTo: infoMessageLabel.trailingAnchor, constant: 8),
            subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subscribeButton.widthAnchor.constraint(equalToConstant: 150),
            subscribeButton.heightAnchor.constraint(equalToConstant: 28),
            
            likedImageView.topAnchor.constraint(equalTo: userImageView.topAnchor),
            likedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likedImageView.widthAnchor.constraint(equalToConstant: 44),
            likedImageView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
