//
//  TabBar.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 05/04/22.
//

import Foundation
import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupNavigationControllers()
    }
    
    private func setupNavigationControllers() {
        viewControllers = [
            createNavController(for: RestaurantRouter.createModule(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: RestaurantRouter.createModule(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: ProfileRouter.createModule(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
        
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
