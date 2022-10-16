//
//  SubcategoryModel.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

class SubcategoryModel {
    
    let data: SubcategoriesData
    
    init?(data: SubcategoriesData) {
        guard let data = data as? SubcategoriesData else {
            return nil
        }
        self.data = data
    }
}
