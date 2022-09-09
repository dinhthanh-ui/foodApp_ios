//
//  popularCollectionViewCell.swift
//  FoodApp
//
//  Created by Macbook Pro on 07/09/2022.
//

import UIKit
import Kingfisher
class popularCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: popularCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var desciptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var popularImage: UIImageView!
    
    func setupPopular(dish: Dish){
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formatCalories
        desciptionLbl.text = dish.description
        popularImage.kf.setImage(with: dish.image?.arUrl)

    }
    
    
    
    
    
}
