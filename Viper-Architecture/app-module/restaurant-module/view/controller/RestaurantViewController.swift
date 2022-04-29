//
//  RestaurantViewController.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 26/11/21.
//

import Foundation
import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var uiTableView: UITableView!
    
    var restaurantPresenter: ViewToPresenterRestaurantProtocol?
    var restaurantArrayList: [RestaurantResult]?
    
    var pageNumber = 1
    var isCanReloadAgain = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeRestaurants()
        configTableView()
        registerTableViewCell()
        getRestaurant()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
    }
    private
    func removeRestaurants() {
        restaurantArrayList?.removeAll()
    }
    private
    func refreshTableView() {
        uiTableView.reloadData()
    }
    private
    func configTableView() {
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
    private
    func registerTableViewCell() {
        uiTableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
    }
    private
    func getRestaurant() {
        isCanReloadAgain = false
        let request = RestaurantRequest(number: pageNumber, size: 10, minorVersion: "3", type: "best_selling", cityId: 1)
        restaurantPresenter?.startFetchRestaurant(with: request)
        showProgressIndicator(view: self.view)
    }
}

extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let restaurants = restaurantArrayList, !restaurants.isEmpty {
            return restaurants.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let restaurants = restaurantArrayList, !restaurants.isEmpty {
            return self.tableView(tableView, cellForNoticeRowAt: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, cellForNoticeRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell else {
            return UITableViewCell()
        }
        cell.setup(with: restaurantArrayList![indexPath.row])
        return cell
    }
}

extension RestaurantViewController: PresenterToRestaurantViewProtocol {
    func onRestaurantResponseSuccess(restaurants: RestaurantResponse) {
        restaurantArrayList = restaurants.data
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func onRestaurantResponseFailed(error: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
