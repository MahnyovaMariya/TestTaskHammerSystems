//
//  Presenter.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 16.10.2022.
//

protocol PresenterDelegate {
    func loadCategoryCollection()
    func loadSubcategoryCollection()
}

class Presenter {
    
    var presenterDelegate: PresenterDelegate?

    var categories = [CategoryModel]()
    var subcategories = [SubcategoryModel]()
    
    init() {}
    
    func getData() {
    
        CategoriesDataLoader().loadCategories {  categories in
            
            self.categories = categories

            for i in 0...self.categories.count - 1 {
                SubcategoriesDataLoader().loadSubcategories(nameCategory: self.categories[i].nameCategory) { subcategories in
                    
                    self.subcategories.append(contentsOf: subcategories)
                    
                    if self.subcategories.count == self.categories.count {
                        
                        self.presenterDelegate?.loadCategoryCollection()
                        self.presenterDelegate?.loadSubcategoryCollection()   
                    }
                }
            }
        }
    }
}
