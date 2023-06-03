//
//  SubscribeButton.swift
//  Instagram
//
//  Created by Денис Курлыков on 03.06.2023.
//

import UIKit

class SubscribeButton: UIButton {
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubscribeButton(with model: Model) {
        if model.subscribe == true {
            setTitle("Вы подписаны", for: .normal)
            backgroundColor = .systemBlue
        } else if model.subscribe == false {
            setTitle("Подписаться", for: .normal)
            if overrideUserInterfaceStyle == .dark {
                setTitleColor(UIColor(named: "TabBarItemColor"), for: .normal)
                layer.borderWidth = 1
                layer.borderColor = UIColor.lightGray.cgColor
                tintColor = .black
            } else {
                setTitleColor(UIColor(named: "TabBarItemColor"), for: .normal)
                layer.borderWidth = 1
                layer.borderColor = UIColor.lightGray.cgColor
                tintColor = .white
            }
        } else {
            isHidden = true
        }
    }
}
