//
//  CategoryCollectionView.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import UIKit

class CategoryCollectionView: UICollectionView {

    static var count = 0
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.categoryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 10, left: Constants.leftDistanceToView, bottom: 10, right: Constants.rightDistanceToView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
