//
//  ProfileViewController.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 14/04/22.
//

import AVFAudio
import AVKit
import Foundation
import UIKit
import WebKit
import WKWebViewJavascriptBridge

class ProfileViewController: UIViewController {
    @IBOutlet private var webView: WKWebView! = WKWebView(frame: CGRect(), configuration: WKWebViewConfiguration())
    @IBOutlet weak var refreshButton: UIButton!
    
    var bridge: WKWebViewJavascriptBridge!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupBridge()
        refreshTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPage()
    }
    
    private func refreshTapped() {
        refreshButton.addTarget(self, action: #selector(refreshAction), for: .touchUpInside)
    }
    
    @objc func refreshAction() {
        bridge.call(handlerName: "test1", data: ["data": "data from ios"]) { (response) in
            print("response :\(String(describing: response))")
        }
    }
    private func setupWebView() {
        webView.navigationDelegate = self
    }
    
    internal func setupBridge() {
        bridge = WKWebViewJavascriptBridge(webView: webView)
        bridge.isLogEnable = true
        bridge.register(handlerName: "test2") { parameters, callback in
            UIDevice.vibrate()
        }
        bridge.register(handlerName: "showBottomBar") { [weak self] response, callback in
            guard let self = self else { return }
            if let validationResponse = response {
                self.showBottomSheet(message: self.getValue(with: "afifObject", response: validationResponse))
            }
        }
        bridge.register(handlerName: "showToast") {[weak self] response, callback in
            guard let self = self else { return }
            if let validationResponse = response {
                self.showToast(message: self.getValue(with: "afifObject", response: validationResponse), seconds: 0.5, color: .green)
            }
        }
        bridge.register(handlerName: "showDialog") { [weak self] response, callback in
            guard let self = self else { return }
            if let validationResponse = response {
                self.showMessage(with: self.getValue(with: "afifObject", response: validationResponse))
            }
        }
    }
    
    internal func getValue(with param: String, response: [String : Any]) -> String {
        let value = response[param]
        return "\(value ?? "")"
    }
    
    private func loadPage() {
        enum LoadDemoPageError: Error {
            case nilPath
        }
        do {
            guard let baseURL = URL(string: "https://nuxt-testing.hungryhub.workers.dev/experiment2") else {
                throw LoadDemoPageError.nilPath
            }
            let requestURL = URLRequest(url: baseURL)
            webView.load(requestURL)
        } catch LoadDemoPageError.nilPath {
            print("Webview loadDemoPage error: pagePath is nil")
        } catch let error {
            print("Webview loadDemoPage error: \(error)")
        }
    }
    
}

extension ProfileViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webViewDidStartLoad")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webViewDidFinishLoad")
    }
}
