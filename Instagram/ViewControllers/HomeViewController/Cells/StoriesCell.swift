//
//  StoriesCell.swift
//  Instagram
//
//  Created by Денис Курлыков on 13.05.2023.
//

import UIKit

class StoriesCell: UITableViewCell {
    
    // MARK: - Public properties
    static let identifier = "storiesCell"
    
    // MARK: - Private properties
    private var item: [StoriesModel] = []
    
    private lazy var layout = UICollectionViewFlowLayout()
    private lazy var collectionView =  UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialising()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Public methods
    // getting data
    func configure(with info: [StoriesModel]) {
        item = info
    }
}

// MARK: - Private methods
private extension StoriesCell {
    func initialising() {

        setupCollectionView()
        setupConstraints()
    }
    
    func setupCollectionView() {
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier)
        
        layout.scrollDirection = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 106),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension StoriesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifier, for: indexPath) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: item[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoriesCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 72, height: 98)
    }
}
