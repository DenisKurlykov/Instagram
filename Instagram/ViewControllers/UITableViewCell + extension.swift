//
//  UITableViewCell + extension.swift
//  Instagram
//
//  Created by Денис Курлыков on 28.05.2023.
//

import UIKit

extension UITableViewCell {
    func contentView(_ add: UIView...) {
        add.forEach { view in
            contentView.addSubview(view)
        }
    }
}
