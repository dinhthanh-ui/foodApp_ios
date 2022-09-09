//
//  Order.swift
//  FoodApp
//
//  Created by Macbook Pro on 08/09/2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish:Dish?
}
