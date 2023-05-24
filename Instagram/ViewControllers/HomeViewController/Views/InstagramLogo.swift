//
//  InstagramLogo.swift
//  Instagram
//
//  Created by Денис Курлыков on 08.05.2023.
//

import UIKit

final class InstagramLogo: UIView {
    
    private enum UIConstants {
        static let logoHeight: CGFloat = 30
        static let logoWidth: CGFloat = 128
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initializing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LogoDropdown")
        return image
    }()
    
    // MARK: - Private methods
    private func initializing() {
        addSubview(logoImage)
        setupConstraints()
    }
    
    private func setupConstraints() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: UIConstants.logoHeight),
            logoImage.widthAnchor.constraint(equalToConstant: UIConstants.logoWidth)
        ])
    }
}
