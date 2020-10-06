//
//  LoginBuilder.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 05.10.2020.
//

import Foundation
import UIKit

final class LoginBuilder: BaseBuilder {
    
    func build() -> UIViewController {
        
        container.register(LoginInteractor.self) { _ in
            LoginInteractor()
        }.initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(LoginPresenter.self)
        }.inObjectScope(.container)
        
        container.register(LoginPresenter.self) { _ in
            LoginPresenter()
        }.initCompleted { (resolver, presenter) in
            presenter.interactor = resolver.resolve(LoginInteractor.self)
            presenter.view = resolver.resolve(LoginViewController.self)
        }.inObjectScope(.container)
        
        container.register(LoginViewController.self) { _ in
            LoginViewController()
        }.initCompleted { (resolver, view) in
            view.presenter = resolver.resolve(LoginPresenter.self)
        }.inObjectScope(.container)
        
        return container.resolve(LoginViewController.self) ?? UIViewController()
    }
    
}
