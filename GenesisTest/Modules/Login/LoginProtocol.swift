//
//  LoginProtocol.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import Foundation
import WebKit

// MARK: -  View -> Presenter
protocol LoginViewOutputProtocol: class {
    func load(webView: WKWebView)
}

// MARK: -  Preseneter -> View
protocol LoginViewInputProtocol: class {
    func showError(message: String)
}

// MARK: -  Presenter -> Interactor
protocol LoginInteractorInputProtocol: class {
    func openAuthorization(_ callBack: (URLRequest) -> ())
    func proceedAutorization(url: URL, completion: (Bool) -> ())
}

// MARK: -  Interactor -> Presenter
protocol LoginInteractorOutputProtocol: class {
    func showError(message: String)
    func showRepository()
}

// MARK: -  Presenter -> Router
protocol LoginRouterInputProtocol: class {
    func pushRepositoryViewController(on view: LoginViewInputProtocol)
}
