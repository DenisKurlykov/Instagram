//
//  UIView + extension.swift
//  Instagram
//
//  Created by Денис Курлыков on 24.05.2023.
//

import UIKit

extension  UIView {
    func disableAutoresizing(_ masks: UIView...) {
        masks.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
