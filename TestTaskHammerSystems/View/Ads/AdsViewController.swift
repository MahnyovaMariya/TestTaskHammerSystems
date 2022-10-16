//
//  AdsViewController.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 16.10.2022.
//

import UIKit

class AdsViewController: UIViewController {

    var adsCollectionView = AdsCollectionView()
    
    private let images = [UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self

        view.addSubview(adsCollectionView)
        view.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)
        adsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        adsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        adsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        adsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension AdsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.reuseId, for: indexPath) as! AdsCollectionViewCell
        cell.adsImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: AdsConstants.adsItemWidth, height: adsCollectionView.frame.height)
    }
}
