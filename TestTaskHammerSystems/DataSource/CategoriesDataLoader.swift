//
//  CategoriesDataLoader.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 14.10.2022.
//

import Foundation

class CategoriesDataLoader {
    
    func loadCategories(completion: @escaping ([CategoryModel]) -> Void ) {
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
                var categories: [CategoryModel] = []
                for (_, data) in jsonDict where data is NSArray{
                    for i in 0...(data as! NSArray).count - 1 {
                        if (data as! NSArray)[i] is NSDictionary {
                            for (index2, data2) in (data as! NSArray)[i] as! NSDictionary {
                                if index2 as! String == "strCategory" {
                                    if let categ = CategoryModel(data: data2 as! String) {
                                        categories.append(categ)
                                    }
                                }
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    completion(categories)
                }
            }
        }
        task.resume()
    }
}




