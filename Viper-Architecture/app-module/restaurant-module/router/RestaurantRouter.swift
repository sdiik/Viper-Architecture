//
//  RestaurantRouter.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation
import UIKit

class RestaurantRouter: PresenterToRouterRestaurantProtocol {
    
    static func createModule() -> RestaurantViewController {
        
        let view = RestaurantViewController()
        let presenter: ViewToPresenterRestaurantProtocol & InteractorToPresenterRestaurantProtocol = RestaurantPresenter()
        let interactor: PresenterToInteractorRestaurantProtocol = RestaurantInteractor()
        let router: PresenterToRouterRestaurantProtocol = RestaurantRouter()

        view.restaurantPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
