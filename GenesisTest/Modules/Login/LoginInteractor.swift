//
//  LoginInteractor.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 23.09.2020.
//

import Foundation

final class LoginInteractor {
    weak var presenter: LoginInteractorOutputProtocol?
}

extension LoginInteractor: LoginInteractorInputProtocol {
    
    func openAuthorization(_ callBack: (URLRequest) -> ()) {
        let gitLoginUrl = Endpoints.loginURL
        let gitLoginRequest = URLRequest(url: gitLoginUrl)
        callBack(gitLoginRequest)
    }
    
    func proceedAutorization(url: URL, completion: (Bool) -> ()) {
        guard let token = GithubUtility.findCodeInUrl(url) else {
            completion(false)
            return
        }
        completion(true)
        authorize(with: token)
    }
}

private extension LoginInteractor {
    func authorize(with token: String) {
        // TODO: - Network request
    }
}
