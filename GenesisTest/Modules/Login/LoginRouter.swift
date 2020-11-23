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
        let repositoryViewController = RepositoryRouter.createModule()
        guard let presentedViewController = view as? LoginViewController else { return }
        presentedViewController.navigationController?.setViewControllers([repositoryViewController], animated:true)
//        presentedViewController.navigationController?.pushViewController(repositoryViewController, animated: true)
        print("Push Repository VC")
    }
}
