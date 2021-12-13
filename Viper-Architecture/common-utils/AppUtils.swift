//
//  AppUtils.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation
import UIKit

func showProgressIndicator(view: UIView) {
    view.isUserInteractionEnabled = false
    
    let progressIndicator = ProgressIndicator(text: "Please wait...")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
}

func hideProgressIndicator(view: UIView) {
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
}
