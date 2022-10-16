//
//  AdsCollectionViewCell.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 16.10.2022.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "AdsCollectionViewCell"
    
    let adsImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(adsImageView)
        backgroundColor = UIColor.clear

        adsImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        adsImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        adsImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        adsImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        adsImageView.backgroundColor = UIColor.green
        adsImageView.layer.cornerRadius = 20
        adsImageView.clipsToBounds = true
        adsImageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        adsImageView.layer.cornerRadius = 30
        adsImageView.clipsToBounds = true
    }
}
