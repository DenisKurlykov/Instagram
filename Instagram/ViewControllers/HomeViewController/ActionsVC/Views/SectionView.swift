//
//  SectionView.swift
//  Instagram
//
//  Created by Денис Курлыков on 31.05.2023.
//

import UIKit

class SectionView: UIView {
    
    // MARK: - Private properties
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TabBarItemColor")
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        addSubview(label)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    func configureLabel(textLabel: String) {
        label.text = textLabel
    }
    
    // MARK: - Private methods
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
}
