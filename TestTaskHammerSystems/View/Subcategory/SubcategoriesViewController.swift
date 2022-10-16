//
//  SubcategoriesViewController.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import UIKit

class SubcategoriesViewController: UIViewController {
    
    var subcategoryCollectionView = SubcategoryCollectionView()
    var subcategories = [SubcategoryModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        subcategoryCollectionView.delegate = self
        subcategoryCollectionView.dataSource = self

        view.addSubview(subcategoryCollectionView)
        
        subcategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subcategoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subcategoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        subcategoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension SubcategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subcategories[section].data.subcategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = subcategoryCollectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryCollectionViewCell.reuseId, for: indexPath) as! SubcategoryCollectionViewCell
            cell.subcategoryImageView.layer.cornerRadius = cell.subcategoryImageView.frame.size.height/2
            cell.subcategoryImageView.clipsToBounds = true
        cell.subcategoryImageView.loadImage(url: self.subcategories[indexPath.section].data.subcategory[indexPath.row].subcategoryImage)
            cell.subcategoryNameLabel.text = self.subcategories[indexPath.section].data.subcategory[indexPath.row].nameSubcategory
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width * 0.5)
    }
}


