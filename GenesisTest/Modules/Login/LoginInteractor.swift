//
//  LoginInteractor.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

final class LoginInteractor {
    weak var presenter: LoginInteractorOutputProtocol?
    private let manager = Session.default
    private let disposeBag = DisposeBag()
}

extension LoginInteractor: LoginInteractorInputProtocol {
    
    func openAuthorization(_ callBack: (URLRequest) -> ()) {
        let gitLoginUrl = Endpoints.loginURL
        let gitLoginRequest = URLRequest(url: gitLoginUrl)
        callBack(gitLoginRequest)
    }
    
    func proceedAutorization(url: URL, completion: (Bool) -> ()) {
        guard let code = GithubUtility.findCodeInUrl(url) else {
            completion(false)
            return
        }
        completion(true)
        authorize(with: code)
    }
}

private extension LoginInteractor {
    func authorize(with code: String) {
        let parameters = GithubUtility.tokenParameters(code: code)
        let url = Endpoints.tokenURL
     
//        RxAlamofire.requestString(.post, url, parameters: parameters, encoding: URLEncoding.default)
//            .debug()
//            .subscribe { (<#Event<(HTTPURLResponse, String)>#>) in
//                <#code#>
//            }
        
        
        let tokenObservable = manager.rx.responseString(.post, url, parameters: parameters)
            .observeOn(MainScheduler.instance)
            .subscribe({ [weak self] (event) in
                switch event {
                case .next((let d, let token)):
                    print(d, token)
                    GithubUtility.saveAccessToken(token)
                    self?.presenter?.showRepository()
                case .error(let error):
                    self?.presenter?.showError(message: error.localizedDescription)
                case .completed:
                    print("Completed")
                }
            })

        tokenObservable.disposed(by: disposeBag)
    }
}
