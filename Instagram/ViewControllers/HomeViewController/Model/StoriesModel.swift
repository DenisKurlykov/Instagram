//
//  StoriesModel.swift
//  Instagram
//
//  Created by Денис Курлыков on 15.05.2023.
//

import UIKit

struct StoriesModel {
    /// Name user
    let name: String
    /// User Image
    let image: UIImage
    /// If there is a new story, the ring in the circle of the user's image lights up
    let visibleRingStory: Bool
    ///  Add a new history (only for the account owner)
    let visibleAddStoryButton: Bool
}

