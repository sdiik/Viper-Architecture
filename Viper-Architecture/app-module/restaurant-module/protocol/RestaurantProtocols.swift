//
//  RestaurantProtocols.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 26/11/21.
//

import Foundation
import UIKit

protocol ViewToPresenterRestaurantProtocol: class {
    var view: PresenterToRestaurantViewProtocol? { get set }
    var interactor: PresenterToInteractorRestaurantProtocol? { get set }
    var router: PresenterToRouterRestaurantProtocol? { get set }
    func startFetchRestaurant(with data: RestaurantRequest)
}
protocol PresenterToRestaurantViewProtocol: class {
    func onRestaurantResponseSuccess(restaurants: RestaurantResponse)
    func onRestaurantResponseFailed(error: String)
}

protocol PresenterToRouterRestaurantProtocol {
    static func createModule() -> RestaurantViewController
}

protocol PresenterToInteractorRestaurantProtocol: class {
    var presenter: InteractorToPresenterRestaurantProtocol? { get set }
    func fetchRestaurant(with data: RestaurantRequest)
}

protocol InteractorToPresenterRestaurantProtocol: class {
    func restaurantFetchSuccess(response: RestaurantResponse)
    func restaurantFetchFailed(message: String)
}
