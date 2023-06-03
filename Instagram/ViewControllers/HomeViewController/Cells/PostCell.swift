//
//  PostCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

final class PostCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    // MARK: - Private properties
    private let userImageView = UIImageView()
    private let avatarInfoStackView = UIStackView()
    private let userNameLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let moreButton = UIButton(type: .system)
    private let postImageView = UIImageView()
    private let likeButton = UIButton(type: .system)
    private let commentButton = UIButton(type: .system)
    private let sharePostButton = UIButton(type: .system)
    private let shareButton = UIButton(type: .system)
    private let numberOfLikesLabel = UILabel()
    private let commentLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialising()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        initialising()
        layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    //MARK: - Public methods
    public func configure(with item: PostModel) {
        userImageView.image = item.userImage
        userNameLabel.text = item.userName
        subTitleLabel.text = item.subTitle
        postImageView.image = item.postImage
        numberOfLikesLabel.text = String("Нравится: \(item.numberOfLikes)")
        if let comment = item.comment {
            configureCommentLabel(with: comment)
        } else {
            commentLabel.isHidden = true
        }
    }
}

// MARK: - Private methods
private extension PostCell {
    func initialising() {
        selectionStyle = .none
        
        contentView(userImageView,
                    avatarInfoStackView,
                    moreButton,
                    postImageView,
                    likeButton,
                    commentButton,
                    sharePostButton,
                    shareButton,
                    numberOfLikesLabel,
                    commentLabel)
        
        setupUserImage()
        setupPostStackView()
        setupUserName()
        setupSubTitle()
        setupMoreButton()
        setupLikeButton()
        setupCommentButton()
        setupSharePostButton()
        setupShareButton()
        setupNumberOfLikes()
        setupCommentLabel()
        
        setupConstraints()
    }
    
    func setupUserImage() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.clipsToBounds = true
    }
    
    func setupPostStackView() {
        avatarInfoStackView.axis = .vertical
        avatarInfoStackView.alignment = .leading
        avatarInfoStackView.spacing = 2
        avatarInfoStackView.distribution = .fillEqually
        avatarInfoStackView.addArrangedSubview(userNameLabel)
        avatarInfoStackView.addArrangedSubview(subTitleLabel)
    }
    
    func setupUserName() {
        userNameLabel.font = .boldSystemFont(ofSize: 12)
        userNameLabel.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupSubTitle() {
        subTitleLabel.font = .systemFont(ofSize: 11)
        subTitleLabel.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupMoreButton() {
        moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        moreButton.tintColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupLikeButton() {
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupCommentButton() {
        commentButton.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        commentButton.tintColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupSharePostButton() {
        sharePostButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sharePostButton.tintColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupShareButton() {
        shareButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        shareButton.tintColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupNumberOfLikes() {
        numberOfLikesLabel.font = .boldSystemFont(ofSize: 14)
        numberOfLikesLabel.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupCommentLabel() {
        commentLabel.textColor = UIColor(named: "TabBarItemColor")
        commentLabel.numberOfLines = 2
    }
    
    func configureCommentLabel(with comment: Comment) {
        let string = comment.userName + ": " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.userName.count)
        commentLabel.font = .systemFont(ofSize: 14)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
        commentLabel.attributedText = attributedString
    }
    
    func setupConstraints() {
        disableAutoresizing(userImageView,
                            avatarInfoStackView,
                            moreButton,
                            postImageView,
                            likeButton,
                            commentButton,
                            sharePostButton,
                            shareButton,
                            numberOfLikesLabel,
                            commentLabel)
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            userImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/12),
            
            avatarInfoStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            avatarInfoStackView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            avatarInfoStackView.heightAnchor.constraint(equalTo: userImageView.heightAnchor),
            
            moreButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/16),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            moreButton.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            postImageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            likeButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/16),
            
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 12),
            commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentButton.widthAnchor.constraint(equalTo: likeButton.widthAnchor),
            commentButton.heightAnchor.constraint(equalTo: likeButton.heightAnchor),
            
            sharePostButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 12),
            sharePostButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            sharePostButton.widthAnchor.constraint(equalTo: likeButton.widthAnchor),
            sharePostButton.heightAnchor.constraint(equalTo: likeButton.heightAnchor),
            
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            shareButton.widthAnchor.constraint(equalTo: likeButton.widthAnchor),
            shareButton.heightAnchor.constraint(equalTo: likeButton.heightAnchor),
            
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            numberOfLikesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
            
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            commentLabel.topAnchor.constraint(equalTo: numberOfLikesLabel.bottomAnchor, constant: 6),
            commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
}
