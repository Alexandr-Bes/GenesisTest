//
//  LoginViewController.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import UIKit
import WebKit

final class LoginViewController: UIViewController {

    var presenter: LoginViewOutputProtocol?

    private lazy var webView: WKWebView = {
        return WKWebView(frame: UIScreen.main.bounds,
                         configuration: WKWebViewConfiguration())
    }()

    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
        setupUI()
    }

    @objc func refreshAction() {
        loadWebView()
    }
    
    private func setupUI() {
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction))
        self.navigationItem.rightBarButtonItem = refreshButton
        self.navigationItem.title = "Authorization"
    }
    
    private func loadWebView() {
        presenter?.load(webView: webView)
    }
    
}

extension LoginViewController: LoginViewInputProtocol {
    func showError(message: String) {
        print(message)
    }
}
