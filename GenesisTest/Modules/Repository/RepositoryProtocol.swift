//
//  RepositoryProtocol.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//

import Foundation

// MARK: -  View -> Presenter
protocol RepositoryViewOutputProtocol: class {
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

// MARK: -  Presenter -> View
protocol RepositoryViewInputProtocol: class {
    func showError(message: String)
}

// MARK: -  Presenter -> Interactor
protocol RepositoryInteractorInputProtocol: class {
    func loadRepositories(with query: String)
}

// MARK: -  Interactor -> Presenter
protocol RepositoryInteractorOutputProtocol: class {
    func showError(message: String)
    func showLoadedData(data: [RepoQuery.Data.Search.Edge?]?)
}

//MARK: - Presenter -> Router
protocol RepositoryRouterInputProtocol {
    func pushRepositoryDetails()
}
