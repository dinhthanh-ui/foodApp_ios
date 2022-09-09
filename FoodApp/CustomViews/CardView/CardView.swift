//
//  CardView.swift
//  FoodApp
//
//  Created by Macbook Pro on 06/09/2022.
//

import Foundation
import UIKit

class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetUp()
    }
    
    private func initSetUp(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
