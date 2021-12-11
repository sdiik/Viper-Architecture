//
//  NoticeProtocols.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 26/11/21.
//

import Foundation
import UIKit

protocol ViewToPresenterNoticeProtocol: class {
    
}
protocol PresenterToNoticeViewProtocol: class {
    func showNotice(noticeArray: Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterNoticeProtocol {
    static func createModule() -> NoticeViewController
}

protocol PresenterToInteractorNoticeProtocol: class {
    
}

protocol InteractorToPresenterNoticeProtocol: class {
    
}
