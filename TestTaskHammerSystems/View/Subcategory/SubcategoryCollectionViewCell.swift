//
//  SubcategoryCollectionViewCell.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import UIKit

class SubcategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SubcategoryCollectionViewCell"
    
    let subcategoryImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let subcategoryNameLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.textColor = UIColor(red: 0.138, green: 0.157, blue: 0.188, alpha: 1.0)
        lbl.font = .boldSystemFont(ofSize: 16.0)
        
        return lbl
    }()
    
    let subcategoryDescriptionLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.numberOfLines = 4
        lbl.textColor = UIColor(red: 0.667, green: 0.667, blue: 0.678, alpha: 1.0)
        lbl.font = .systemFont(ofSize: 12.0)
        lbl.text = "Some text ..."
        
        return lbl
    }()
    
    let subcategoryPriceButton: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.layer.borderColor = UIColor(red: 0.915, green: 0.301, blue: 0.420, alpha: 1.0).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 10
        btn.setTitleColor(UIColor(red: 0.915, green: 0.301, blue: 0.420, alpha: 1.0), for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.titleLabel?.font = .systemFont(ofSize: 14.0)
        btn.setTitle("from ...", for: .normal)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(subcategoryImageView)
        addSubview(subcategoryNameLabel)
        addSubview(subcategoryDescriptionLabel)
        addSubview(subcategoryPriceButton)
        
        backgroundColor = UIColor.white

        subcategoryImageView.heightAnchor.constraint(equalToConstant: SubcategoryConstants.subcategoryItemWidth/2.5).isActive = true
        subcategoryImageView.widthAnchor.constraint(equalToConstant: SubcategoryConstants.subcategoryItemWidth/2.5).isActive = true
        subcategoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        subcategoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        subcategoryNameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        subcategoryNameLabel.leadingAnchor.constraint(equalTo: subcategoryImageView.trailingAnchor, constant: 10).isActive = true
        subcategoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subcategoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        subcategoryDescriptionLabel.leadingAnchor.constraint(equalTo: subcategoryImageView.trailingAnchor, constant: 20).isActive = true
        subcategoryDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subcategoryDescriptionLabel.topAnchor.constraint(equalTo: subcategoryNameLabel.bottomAnchor, constant: 5).isActive = true
        subcategoryDescriptionLabel.bottomAnchor.constraint(equalTo: subcategoryPriceButton.topAnchor, constant: -5).isActive = true
        
        subcategoryPriceButton.widthAnchor.constraint(equalToConstant: SubcategoryConstants.subcategoryItemWidth/4).isActive = true
        subcategoryPriceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subcategoryPriceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        subcategoryImageView.layer.cornerRadius = subcategoryImageView.frame.size.height/2
        subcategoryImageView.clipsToBounds = true
    }
}
