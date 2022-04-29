//
//  AppDelegate.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 25/11/21.
//

import UIKit
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = TabBar()
        window?.rootViewController = home
        window?.makeKeyAndVisible()
        
        setupStatusBar()
        
        return true
    }
    
    private func setupStatusBar() {
        UIApplication.shared.statusBarStyle = .lightContent
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = .blue
            statusBar.tintColor = .white
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
    }
    
}
