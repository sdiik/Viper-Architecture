//
//  RestaurantPresenter.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation

class RestaurantPresenter: ViewToPresenterRestaurantProtocol {
    var view: PresenterToRestaurantViewProtocol?
    
    var interactor: PresenterToInteractorRestaurantProtocol?
    
    var router: PresenterToRouterRestaurantProtocol?
    
    func startFetchRestaurant(with query: RestaurantRequest) {
        interactor?.fetchRestaurant(with: query)
    }
}
extension RestaurantPresenter: InteractorToPresenterRestaurantProtocol {
    func restaurantFetchSuccess(response: RestaurantResponse) {
        view?.onRestaurantResponseSuccess(restaurants: response)
    }
    
    func restaurantFetchFailed(message: String) {
        view?.onRestaurantResponseFailed(error: message)
    }
}
