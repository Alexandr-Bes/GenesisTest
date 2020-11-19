//
//  LoginRouter.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//

import Foundation
import UIKit

final class LoginRouter {
    static func buildModule() -> UINavigationController {
        let viewController = LoginBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

extension LoginRouter: LoginRouterInputProtocol {
    func pushRepositoryViewController(on view: LoginViewInputProtocol) {
        
        print("Repo")
//        let repositoryViewController = RepositoryBuilder.buildModule()
//        let presentedViewController = view as! LoginViewController
//        presentedViewController.navigationController?.pushViewController(repositoryVC, animated: true)
    }
}
