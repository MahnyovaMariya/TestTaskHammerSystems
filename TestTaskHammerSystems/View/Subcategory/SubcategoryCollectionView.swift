//
//  SubcategoryCollectionView.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import UIKit

class SubcategoryCollectionView: UICollectionView {

    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)
        register(SubcategoryCollectionViewCell.self, forCellWithReuseIdentifier: SubcategoryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        
        layout.minimumLineSpacing = SubcategoryConstants.subategoryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: SubcategoryConstants.topDistanceToView, left: 0, bottom: SubcategoryConstants.bottomDistanceToView, right: 0)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
