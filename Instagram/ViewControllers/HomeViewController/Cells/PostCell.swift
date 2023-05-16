//
//  PostCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    //MARK: - Public methods
    public func configure(with item: PostModel) {
        userImage.image = item.userImage
        userName.text = item.userName
        subTitle.text = item.subTitle
        postImage.image = item.postImage
        numberOfLikesLabel.text = String("Нравится: \(item.numberOfLikes)")
        if let comment = item.comment{
            configureCommentLabel(with: comment)
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialising()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let userImage = UIImageView()
    private let avatarInfoStack = UIStackView()
    private let userName = UILabel()
    private let subTitle = UILabel()
    private let moreButton = UIButton(type: .system)
    private let postImage = UIImageView()
    private let likeButton = UIButton(type: .system)
    private let commentButton = UIButton(type: .system)
    private let sharePostButton = UIButton(type: .system)
    private let shareButton = UIButton(type: .system)
    private let numberOfLikesLabel = UILabel()
    private let commentLabel = UILabel()
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        initialising()
        layoutIfNeeded()
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }
}

// MARK: - Private methods
private extension PostCell {
    func initialising() {
        contentView(userImage,
                    avatarInfoStack,
                    moreButton,
                    postImage,
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
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.clipsToBounds = true
    }
    
    func setupPostStackView() {
        avatarInfoStack.axis = .vertical
        avatarInfoStack.alignment = .leading
        avatarInfoStack.spacing = 2
        avatarInfoStack.distribution = .fillEqually
        avatarInfoStack.addArrangedSubview(userName)
        avatarInfoStack.addArrangedSubview(subTitle)
    }
    
    func setupUserName() {
        userName.font = .boldSystemFont(ofSize: 12)
        userName.textColor = UIColor(named: "TabBarItemColor")
    }
    
    func setupSubTitle() {
        subTitle.font = .systemFont(ofSize: 11)
        subTitle.textColor = UIColor(named: "TabBarItemColor")
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
        disableAutoresizing(userImage,
                            avatarInfoStack,
                            moreButton,
                            postImage,
                            likeButton,
                            commentButton,
                            sharePostButton,
                            shareButton,
                            numberOfLikesLabel,
                            commentLabel)
        
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor),
            userImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/12),
            
            avatarInfoStack.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            avatarInfoStack.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            avatarInfoStack.heightAnchor.constraint(equalTo: userImage.heightAnchor),
            
            moreButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/16),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            moreButton.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            likeButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
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

// MARK: - Method for add view to superView
private extension PostCell {
    func contentView(_ add: UIView...) {
        add.forEach { view in
            contentView.addSubview(view)
        }
    }
}

// MARK: - Method disable autoresizingMask
private extension PostCell {
    func disableAutoresizing(_ masks: UIView...) {
        masks.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
