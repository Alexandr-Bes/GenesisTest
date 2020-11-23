//
//  RepositoryRouter.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//
//

import Foundation
import UIKit

final class RepositoryRouter {
//    weak var presenter: RepositoryPresenter?
//    weak var navigationController: UINavigationController?
    
    static func createModule() -> UIViewController {
        let repositoryView = RepositoryBuilder().build()
        return repositoryView
    }
}

// MARK: - Router Input

extension RepositoryRouter: RepositoryRouterInputProtocol {
    func pushRepositoryDetails() {
        // TODO: -
    }
}

private extension RepositoryRouter {
    
}
