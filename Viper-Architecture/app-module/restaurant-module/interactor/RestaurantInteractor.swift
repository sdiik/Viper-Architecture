//
//  RestaurantInteractor.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation

class RestaurantInteractor: PresenterToInteractorRestaurantProtocol {
    var presenter: InteractorToPresenterRestaurantProtocol?
    private let networkManager = NetworkManager()
    
    func fetchRestaurant(with data: RestaurantRequest) {
        networkManager.fetchRestaurant(with: data) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurantResponse):
                self.presenter?.restaurantFetchSuccess(response: restaurantResponse)
            case .failure(let error):
                self.presenter?.restaurantFetchFailed(message: error.localizedDescription)
            }
        }
    }
}
