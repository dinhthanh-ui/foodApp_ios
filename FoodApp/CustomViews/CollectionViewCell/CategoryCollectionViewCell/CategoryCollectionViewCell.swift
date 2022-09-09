//
//  CategoryCollectionViewCell.swift
//  FoodApp
//
//  Created by Macbook Pro on 06/09/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setupCategory(category: DishCategory){
        categoryImageView.kf.setImage(with: category.image?.arUrl)
        categoryTitleLbl.text = category.title
    }
    
}

