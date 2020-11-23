//
//  RepositoryPresenter.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//
//

import Foundation

final class RepositoryPresenter {
    
    // MARK: Properties
    
    weak var view: RepositoryViewInputProtocol?
    var interactor: RepositoryInteractorInputProtocol?
    var router: RepositoryRouterInputProtocol?
    
    var repositoriesData: [RepoQuery.Data.Search.Edge?]? = nil
}

// MARK: Inputs from view

extension RepositoryPresenter: RepositoryViewOutputProtocol {
    func viewDidLoad() {
//        view.showActivity
    }
    
    func searchRepositories(with text: String) {
        let result = interactor?.loadRepositories(with: text)
        print(result)
//        interactor?.loadRepositories(with: text)
    }
    
    func refresh() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return repositoriesData?.count ?? 1
    }
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
}

// MARK: Inputs from Interactor

extension RepositoryPresenter: RepositoryInteractorOutputProtocol {
    func showLoadedData(data: [RepoQuery.Data.Search.Edge?]?) {
        repositoriesData = data
        view?.showRepositories(with: data)
    }
    
    func showError(message: String) {
        view?.showError(message: message)
    }
}

// MARK: - Private

private extension RepositoryPresenter {
    
}
