//
//  ExtensionUIImageView.swift
//  TestTaskHammerSystems
//
//  Created by Мария on 16.10.2022.
//

import UIKit

extension UIImageView {
    func loadImage(url: String) {
        
        guard let url = URL(string: url) else {return}
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
        }
    }
}
