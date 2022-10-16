//
//  ViewController.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14_10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerSubview: UIView!
    @IBOutlet weak var containerList: UIView!
    
    let presenter = Presenter()
    var categories = [CategoryModel]()
    var categoryCollectionView = CategoryCollectionView()
    var subcatVC: SubcategoriesViewController?
    var adsVC: AdsViewController?
    
    var extraButtonOne = UIButton()
    var extraButtonTwo = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        containerList.layer.cornerRadius = 30
        containerList.clipsToBounds = true

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self

        containerView.addSubview(categoryCollectionView)
        
        view.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)
        containerView.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1.0)
        
        categoryCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        categoryCollectionView.topAnchor.constraint(equalTo: containerSubview.bottomAnchor).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        containerList.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 1).isActive = true
        
        adsVC?.adsCollectionView.reloadData()
        
        presenter.presenterDelegate = self
        presenter.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let subcatVC = segue.destination as? SubcategoriesViewController {
            self.subcatVC = subcatVC
        }
        
        if let adsVC = segue.destination as? AdsViewController {
            self.adsVC = adsVC
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryNameButton.setTitle(categories[indexPath.row].nameCategory, for: .normal)
        cell.categoryNameButton.tag = indexPath.row
        cell.categoryNameButton.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchDown)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.categoryItemWidth, height: categoryCollectionView.frame.height / 2.5)
    }
}

extension ViewController {
    
    @objc private func buttonTapped(button: UIButton) {

        for i in 0...(self.subcatVC?.subcategories.count)! - 1 {
            if button.titleLabel?.text == self.subcatVC?.subcategories[i].data.nameCategory {
                self.subcatVC?.subcategoryCollectionView.scrollToItem(at: IndexPath(row: 0, section: i), at: .top, animated: true)
                self.subcatVC?.subcategoryCollectionView.reloadData()
            }
        }

        if CategoryCollectionView.count == 1 {
            setNormalButtonStyle(btn: extraButtonOne)
            extraButtonTwo = button
            setSelectButtonStyle(btn: extraButtonTwo)
            CategoryCollectionView.count = 0
        } else {
            setNormalButtonStyle(btn: extraButtonTwo)
            extraButtonOne = button
            setSelectButtonStyle(btn: extraButtonOne)
            CategoryCollectionView.count += 1
        }
    }
    
    func setSelectButtonStyle(btn: UIButton){
        
        btn.backgroundColor = UIColor(red: 0.937, green: 0.819, blue: 0.863, alpha: 1)
        btn.layer.borderColor = UIColor(red: 0.937, green: 0.819, blue: 0.863, alpha: 1).cgColor
        btn.setTitleColor(UIColor(red: 0.915, green: 0.301, blue: 0.420, alpha: 1), for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14.0)
    }
    
    func setNormalButtonStyle(btn: UIButton){
        
        btn.backgroundColor = UIColor.clear
        btn.layer.borderColor = UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1).cgColor
        btn.layer.borderWidth = 1.0
        btn.setTitleColor(UIColor(red: 0.924, green: 0.678, blue: 0.749, alpha: 1), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14.0)
    }
}

extension ViewController: PresenterDelegate {
    
    func loadCategoryCollection() {
        categories = presenter.categories
        categoryCollectionView.reloadData()
    }
    
    func loadSubcategoryCollection() {
        subcatVC!.subcategories = presenter.subcategories
        subcatVC!.subcategoryCollectionView.reloadData()
    }
}
