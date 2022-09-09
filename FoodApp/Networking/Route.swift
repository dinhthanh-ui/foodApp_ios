//
//  Route.swift
//  FoodApp
//
//  Created by Macbook Pro on 09/09/2022.
//

import Foundation

enum Route{
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case fechAllCategories
    case placeOrder(String)
    case fetchCategroyDishes(String)
    case fetchOrder
    
    var description: String{
        switch self {
        case .fechAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategroyDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrder:
            return "/orders"
        }
    }
}
