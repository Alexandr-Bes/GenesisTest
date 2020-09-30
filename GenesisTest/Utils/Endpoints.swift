//
//  Endpoints.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 29.09.2020.
//

import Foundation

class Endpoints {
    
    private static let authURL = "https://github.com/login/oauth"
    private static let tokenURL = "https://github.com/login/oauth/access_token"
    
    private static let loginUrlString = "\(authURL)/authorize?client_id=\(Constants.clientId)&scope=\(Constants.scope)&redirect_uri=\(Constants.redirectURI)&state=\(UUID().uuidString)"
    
    static var loginURL: URL {
        return URL(string: loginUrlString)!
    }
}
