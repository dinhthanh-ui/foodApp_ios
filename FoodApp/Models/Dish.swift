//
//  Dish.swift
//  FoodApp
//
//  Created by Macbook Pro on 07/09/2022.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories : Int?
    
    var formatCalories: String {
        return "\( calories ?? 0 ) calories"
    }
    
}

