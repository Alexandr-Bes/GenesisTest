//
//  RepositoryInteractor.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//

import Foundation
import RxSwift
import Apollo

final class RepositoryInteractor {
    weak var presenter: RepositoryInteractorOutputProtocol?
    let disposeBag = DisposeBag()
}

extension RepositoryInteractor {
    
}

// MARK: - Interactor Input

extension RepositoryInteractor: RepositoryInteractorInputProtocol {
    
    func loadRepositories(with query: String) {
        let textQuery = GithubUtility.makeCorrectStringRequest(from: query)
        let query = RepoQuery(queryString: textQuery)
        
        NetworkManager.shared.apollo.rx.fetch(query: query)
            .map { $0.search.edges }
            .subscribe(onSuccess: { [weak self] result in
                self?.presenter?.showLoadedData(data: result)
            }, onError: { [weak self] error in
                self?.presenter?.showError(message: error.asAFError?.localizedDescription ?? "Error received")
                print("Received error: \(error).")
            })
            .disposed(by: disposeBag)
    }
 
    func loadRepositories1(with query: String) {
        
        let textQuery = GithubUtility.makeCorrectStringRequest(from: query)
        NetworkManager.shared.apollo.fetch(query: RepoQuery(queryString: textQuery)) { [weak self] result  in
            switch result {
            case .success(let requestData):
                let returnData = requestData.data?.search.edges
                self?.presenter?.showLoadedData(data: returnData)
            case .failure(let error):
                self?.presenter?.showError(message: error.localizedDescription)
            }
        }
        
//        NetworkManager().apollo.fetch(query: RepoQuery(queryString: textQuery)) { [weak self] result  in
//            switch result {
//            case .success(let requestData):
//                let returnData = requestData.data?.search.edges
//                self?.presenter?.showLoadedData(data: returnData)
//            case .failure(let error):
//                self?.presenter?.showError(message: error.localizedDescription)
//            }
//        }
        
    }
}
