//
//  SubcategoriesDataLoader.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import Foundation

class SubcategoriesDataLoader {
    
    func loadSubcategories(nameCategory: String, completion: @escaping ([SubcategoryModel]) -> Void) {
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + nameCategory)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonDict = json as? NSDictionary {
                var subcategories: [SubcategoryModel] = []
                var subcategoriesDetailData: [SubcategoriesDetailData] = []
                var subcategoriesDataObject = SubcategoriesData(nameCategory: "", subcategory: [])
                var subcategoriesDetailDataObject = SubcategoriesDetailData(nameSubcategory: "", subcategoryImage: "")
                for (_, data) in jsonDict where data is NSArray {
                    
                    for i in 0...(data as! NSArray).count - 1 {
                        if (data as! NSArray)[i] is NSDictionary {
                            for (index2, data2) in (data as! NSArray)[i] as! NSDictionary {
                                if index2 as! String == "strMeal" {
                                    subcategoriesDetailDataObject.nameSubcategory = data2 as! String
                                } else if index2 as! String == "strMealThumb" {
                                    subcategoriesDetailDataObject.subcategoryImage = data2 as! String
                                }
                            }
                            subcategoriesDetailData.append(subcategoriesDetailDataObject)
                            subcategoriesDetailDataObject.nameSubcategory = ""
                            subcategoriesDetailDataObject.subcategoryImage = ""
                        }
                    }
                    subcategoriesDataObject.nameCategory = nameCategory
                    subcategoriesDataObject.subcategory = subcategoriesDetailData
                    if let subcat = SubcategoryModel(data: subcategoriesDataObject) {
                        subcategories.append(subcat)
                        subcategoriesDetailData.removeAll()
                    }
                }
                DispatchQueue.main.async {
                    completion(subcategories)
                }
            }
        }
        task.resume()
    }
}
