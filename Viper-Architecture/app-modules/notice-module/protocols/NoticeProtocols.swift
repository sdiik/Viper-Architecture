//
//  NoticeProtocols.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 26/11/21.
//

import Foundation
import UIKit

protocol ViewToPresenterNoticeProtocol: class {
    var view: ViewToPresenterNoticeProtocol? { get set }
}
protocol PresenterToNoticeViewProtocol: class {
    func showNotice(noticeArray: Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterNoticeProtocol {
    static func createModule() -> NoticeViewController
}

protocol PresenterToInteractorNoticeProtocol: class {
    var presenter: InteractorToPresenterNoticeProtocol? { get set }
    func fetchNotice()
}

protocol InteractorToPresenterNoticeProtocol: class {
    func noticeFetchSuccess(NoticeList: Array<NoticeModel>)
    func noticeFetchFailed()
}
