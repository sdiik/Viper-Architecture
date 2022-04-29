//
//  Alert.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 29/04/22.
//

import AVFoundation
import Foundation
import NBBottomSheet
import UIKit

extension UIViewController {
    internal func showMessage(with message: String, title: String = "Alert") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    internal func showToast(message : String, seconds: Double, color: UIColor = .black){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = color
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}

extension UIViewController {
    internal func showBottomSheet(message : String?) {
        let controller = bottomSheetController()
        controller.descriptionValue = message
        
        var configuration: NBBottomSheetConfiguration
        configuration = NBBottomSheetConfiguration(sheetSize: .fixed(143))
        
        let bottomSheetController = NBBottomSheetController(configuration: configuration)
        bottomSheetController.present(controller, on: self)
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
