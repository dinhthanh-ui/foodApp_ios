//
//  String+Extensions.swift
//  FoodApp
//
//  Created by Macbook Pro on 06/09/2022.
//

import Foundation

extension String {
    var arUrl: URL? {
        return URL(string: self)
    }
}
