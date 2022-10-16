//
//  AdsCollectionView.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 16.10.2022.
//

import UIKit

class AdsCollectionView: UICollectionView {

    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = UIColor.clear/*(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)*/
        register(AdsCollectionViewCell.self, forCellWithReuseIdentifier: AdsCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = AdsConstants.adsMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: AdsConstants.leftDistanceToView, bottom: 0, right: AdsConstants.rightDistanceToView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
