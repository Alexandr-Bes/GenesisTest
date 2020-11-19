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
    
}

// MARK: Inputs from view

extension RepositoryPresenter: RepositoryViewOutputProtocol {
    func viewDidLoad() {
//        view.showActivity
//        interactor?.loadRepositories
    }
    
    func refresh() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return 1
    }
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
}

// MARK: Inputs from Interactor

extension RepositoryPresenter: RepositoryInteractorOutputProtocol {
    func showError(message: String) {
        view?.showError(message: message)
    }
    
    func showLoadedData() {
//        view.showRepositories
    }
}

// MARK: - Private

private extension RepositoryPresenter {
    
}
