//
//  UIView+Extensions.swift
//  FoodApp
//
//  Created by Macbook Pro on 05/09/2022.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
