//
//  CategoryModel.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

class CategoryModel {
    
    let nameCategory: String
    
    init?(data: String) {
        guard let nameCategory = data as? String else {
            return nil
        }
        self.nameCategory = nameCategory
    }
}
