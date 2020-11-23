//
//  LoginViewController.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import UIKit
import WebKit

final class LoginViewController: UIViewController {

    //MARK: - Properties
    
    var presenter: LoginViewOutputProtocol?

    // MARK: - UI
    
    private lazy var webView: WKWebView = {
        return WKWebView(frame: UIScreen.main.bounds,
                         configuration: WKWebViewConfiguration())
    }()

    // MARK: - Lifecycle
    
    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    @objc private func refreshAction() {
//        self.webView.reload()
        loadWebView()
    }
    
    private func setupUI() {
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction))
        self.navigationItem.rightBarButtonItem = refreshButton
        self.navigationItem.title = "Authorization"
        webView.addConstraintsToSafeArea()
    }
    
    private func loadWebView() {
        presenter?.load(webView: webView)
    }
    
}

// MARK: - View Input

extension LoginViewController: LoginViewInputProtocol {
    func showError(message: String) {
        UIAlertController.showAlert(in: self, title: "Error", message: message, closeTitle: "Ok")
    }
}
