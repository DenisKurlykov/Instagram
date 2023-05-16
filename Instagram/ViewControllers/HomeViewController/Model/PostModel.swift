//
//  PostImageModel.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

struct PostModel {
    let userImage: UIImage
    let userName: String
    let subTitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: Comment?
}

struct Comment {
    let userName: String
    let commentText: String
}
