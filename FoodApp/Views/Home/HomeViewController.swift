//
//  HomeViewController.swift
//  FoodApp
//
//  Created by Macbook Pro on 05/09/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialsCollectionView: UICollectionView!
   
    
    var categories: [DishCategory] = []
    var popular: [Dish] = []
    var specials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success( let allData):
                ProgressHUD.dismiss()
                self?.categories = allData.categories ?? []
                self?.popular = allData.populars ?? []
                self?.specials = allData.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefSpecialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: popularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: popularCollectionViewCell.identifier)
        chefSpecialsCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifier)
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popular.count
        case chefSpecialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setupCategory(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCollectionViewCell.identifier, for: indexPath) as! popularCollectionViewCell
            cell.setupPopular(dish: popular[indexPath.row])
            return cell
        case chefSpecialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCollectionViewCell.identifier, for: indexPath) as! ChefSpecialsCollectionViewCell
            cell.setupChef(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let collection = ListDishesViewController.instantiate()
            collection.category = categories[indexPath.row]
            navigationController?.pushViewController(collection, animated: true)

        }
        else{
            let collection = DishDetailViewController.instantiate()
            collection.dish = collectionView == popularCollectionView ? popular[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(collection, animated: true)
        }
    }
}
