//
//  PostImageModel.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

struct PostModel {
    /// User Avatar Image
    let userImage: UIImage
    /// User Name
    let userName: String
    ///
    let subTitle: String
    /// Post Image
    let postImage: UIImage
    /// Number of likes
    let numberOfLikes: Int
    /// Comment for post
    let comment: Comment?
}

struct Comment {
    /// The user who wrote the comment
    let userName: String
    /// Comment text
    let commentText: String
}
