//
//  AppUtils.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation
import UIKit

/* Show  progress Indicator */
func showProgressIndicator(view: UIView) {
    view.isUserInteractionEnabled = false
    
    let progressIndicator = ProgressIndicator(text: "Please wait...")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
}
/*  Hide progress Indicator */
func hideProgressIndicator(view: UIView) {
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
}
