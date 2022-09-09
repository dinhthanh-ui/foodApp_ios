//
//  DishListTableViewCell.swift
//  FoodApp
//
//  Created by Macbook Pro on 08/09/2022.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setupDishListTable(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.arUrl)
        TitleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    func setupOrder(order: Order){
        dishImageView.kf.setImage(with: order.dish?.image?.arUrl)
        TitleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    
    
}
