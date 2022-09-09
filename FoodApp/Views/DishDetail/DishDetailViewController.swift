//
//  DishDetailViewController.swift
//  FoodApp
//
//  Created by Macbook Pro on 08/09/2022.
//

import UIKit
import ProgressHUD
import Kingfisher
class DishDetailViewController: UIViewController {

    @IBOutlet weak var CaloriesLbl: UILabel!
    @IBOutlet weak var NameTxt: UITextField!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var TitleLbl: UILabel!
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poplateView()
    }
    private func poplateView(){
        dishImageView.kf.setImage(with: dish.image?.arUrl)
        TitleLbl.text = dish.name
        descriptionLbl.text = dish.description
        CaloriesLbl.text = dish.formatCalories
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        guard let name = NameTxt.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please Enter You Name ")
            return
        }
        ProgressHUD.show("Placing Order ....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received !!!")
            case .failure( let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
       
    }
    
}
