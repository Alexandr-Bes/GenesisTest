//
//  LoginPresenter.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import Foundation
import WebKit

final class LoginPresenter: NSObject {
    weak var view: LoginViewInputProtocol?
    var interactor: LoginInteractorInputProtocol?
}

// MARK: - LoginViewOutputProtocol
extension LoginPresenter: LoginViewOutputProtocol {
    func load(webView: WKWebView) {
        webView.navigationDelegate = self
        interactor?.openAuthorization({ (request) in
            webView.load(request)
        })

    }
}

// MARK: - Login
extension LoginPresenter: LoginInteractorOutputProtocol {
    func showError(message: String) {
        view?.showError(message: message)
    }
}

// MARK: - WKNavigationDelegate
extension LoginPresenter: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            interactor?.proceedAutorization(url: url, completion: { (isFoundToken) in
                print(isFoundToken)
                decisionHandler( isFoundToken ? .cancel : .allow)
            })
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        view?.showError(message: error.localizedDescription)
    }
}
