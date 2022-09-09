//
//  ListOrdersViewController.swift
//  FoodApp
//
//  Created by Macbook Pro on 08/09/2022.
//

import UIKit
import ProgressHUD
class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var order: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCell()
        ProgressHUD.show()
    }
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrder { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.order = orders
                self?.tableview.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCell(){
        tableview.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setupOrder(order: order[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = order[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
