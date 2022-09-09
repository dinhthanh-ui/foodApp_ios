//
//  AllDishes.swift
//  FoodApp
//
//  Created by Macbook Pro on 09/09/2022.
//

import Foundation
struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
 
