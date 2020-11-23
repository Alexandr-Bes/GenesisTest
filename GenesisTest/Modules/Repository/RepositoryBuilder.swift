//
//  RepositoryBuilder.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 19.11.2020.
//

import Foundation
import UIKit


final class RepositoryBuilder: BaseBuilder {
    
    func build() -> UIViewController {
        container.register(RepositoryInteractor.self) { _ in
            RepositoryInteractor()
        }.initCompleted { (resolver, interactor) in
            interactor.presenter = resolver.resolve(RepositoryPresenter.self)
        }.inObjectScope(.container)
        
        container.register(RepositoryPresenter.self) { _ in
            RepositoryPresenter()
        }.initCompleted { (resolver, presenter) in
            presenter.interactor = resolver.resolve(RepositoryInteractor.self)
            presenter.view = resolver.resolve(RepositoryView.self)
            presenter.router = resolver.resolve(RepositoryRouter.self)
        }.inObjectScope(.container)
        
        container.register(RepositoryView.self) { _ in
            RepositoryView()
        }.initCompleted { (resolver, view) in
            view.presenter = resolver.resolve(RepositoryPresenter.self)
        }.inObjectScope(.container)
        
        container.register(RepositoryRouter.self) { _ in
            RepositoryRouter()
        }.initCompleted { (resolver, router) in
        }.inObjectScope(.container)
        
        return container.resolve(RepositoryView.self) ?? UIViewController()
    }
    
}
