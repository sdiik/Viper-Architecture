//
//  bottomSheetController.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 29/04/22.
//

import Foundation
import UIKit

class bottomSheetController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    var descriptionValue: String?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.roundCorners([.topLeft, .topRight], radius: 15)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionValue ?? "..."
    }
    
    @IBAction func dismissButtonTapped(sender: AnyObject?) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIView extension
private extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        var rect = bounds
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                rect.size.height += window.safeAreaInsets.bottom
            }
        }
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
