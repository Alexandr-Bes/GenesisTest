//
//  Endpoints.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 29.09.2020.
//

import Foundation

class Endpoints {
    
    private static let authURL = "https://github.com/login/oauth/"
    private static let loginUrlString = "\(authURL)/authorize?client_id=\(Constants.clientId)&redirect_url=\(Constants.redirectURL)&state=\(Constants.randomString)"
    
    //&scope=\(Constants.scope)
    
    static var loginURL: URL {
        return URL(string: loginUrlString)!
    }
    
    static var tokenURL: URL {
        return URL(string: "\(authURL)/access_token")!
    }
}
