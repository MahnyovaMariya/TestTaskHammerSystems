//
//  CategoryCollectionViewCell.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CategoryCollectionViewCell"
    
    let categoryNameButton: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.clear
        btn.layer.borderColor = UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1).cgColor
        btn.layer.borderWidth = 1.0
        btn.setTitleColor(UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14.0)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(categoryNameButton)
        backgroundColor = UIColor.clear
        categoryNameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        categoryNameButton.widthAnchor.constraint(equalToConstant: Constants.categoryItemWidth - 10).isActive = true
        categoryNameButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        categoryNameButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        categoryNameButton.backgroundColor = UIColor.clear
        categoryNameButton.layer.borderColor = UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1).cgColor
        categoryNameButton.layer.borderWidth = 1.0
        categoryNameButton.setTitleColor(UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1), for: .normal)
        categoryNameButton.titleLabel?.font = .systemFont(ofSize: 14.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
