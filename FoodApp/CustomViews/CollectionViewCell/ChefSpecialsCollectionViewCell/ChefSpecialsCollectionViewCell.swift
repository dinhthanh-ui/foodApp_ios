//
//  ChefSpecialsCollectionViewCell.swift
//  FoodApp
//
//  Created by Macbook Pro on 07/09/2022.
//

import UIKit
import Kingfisher

class ChefSpecialsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ChefSpecialsCollectionViewCell.self)
    @IBOutlet weak var chefSpecialsImageView: UIImageView!
    @IBOutlet weak var chefSpecialsDescriptionLbl: UILabel!
    @IBOutlet weak var chefSpecialsCaloriesLbl: UILabel!
    @IBOutlet weak var chefSpecialsTitleLbl: UILabel!
    
    func setupChef(dish: Dish){
        chefSpecialsImageView.kf.setImage(with: dish.image?.arUrl)
        chefSpecialsTitleLbl.text = dish.name
        chefSpecialsDescriptionLbl.text = dish.description
        chefSpecialsCaloriesLbl.text = dish.formatCalories
    }
    
    

}
