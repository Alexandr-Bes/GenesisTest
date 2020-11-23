//
//  GithubUtility.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 05.10.2020.
//

import Foundation

class GithubUtility {
    static func findCodeInUrl(_ url: URL) -> String? {
        var newUrlString = url.absoluteString
        let codeSuffix = "&state=\(Constants.randomString)"
        if newUrlString.hasPrefix(Constants.redirectURL) && newUrlString.hasSuffix(codeSuffix) {
            newUrlString = newUrlString.replacingOccurrences(of: Constants.redirectURL, with: "")
            newUrlString = newUrlString.replacingOccurrences(of: codeSuffix, with: "")
            let codePrefix = "?code="
            if newUrlString.hasPrefix(codePrefix) {
                newUrlString = newUrlString.replacingOccurrences(of: codePrefix, with: "")
                let isCode = newUrlString.range(of: "^[a-zA-Z0-9_]*$", options: .regularExpression, range: nil, locale: nil) != nil
                return isCode ? newUrlString : nil
            }
        }
        return nil
    }
    
    static func tokenParameters(code: String) -> [String: Any] {
        let parameters: [String: Any] = ["client_id"     : Constants.clientId,
                                         "client_secret" : Constants.clientSecret,
                                         "code"          : code]
//                                         "redirect_uri": Constants.redirectURI,
//                                         "state" : Constants.randomString]
        return parameters
    }
    
    static func saveAccessToken(_ token: String) {
        let substrings : [String] = token.components(separatedBy: "&")
        let token = substrings.filter { $0.hasPrefix("access_token=") }.first?.replacingOccurrences(of: "access_token=", with: "") // take a look
        UserDefaultsLocalStorageAdapter().set(object: token, for: Constants.accessToken)
    }
    
    static func getHeaderForRepoRequest() -> [String : String]? {
        let accessToken: String? = UserDefaultsLocalStorageAdapter().get(for: Constants.accessToken) ?? nil
        guard let token = accessToken else { return nil }
        
        let headers = ["Authorization" : "Bearer \(token)",
                        "Content-Type" : "application/json"]
        return headers
    }
    
    // Return text with sorting ordered by stars
    static func makeCorrectStringRequest(from string: String) -> String {
        let result = string + " sort:stars"
        return result
    }
    
    //    var token: String {
    //        set {
    //            UserDefaultsLocalStorageAdapter().set(object: newValue, for: Constants.accessToken)
    //        }
    //        get {
    //            return UserDefaultsLocalStorageAdapter().get(for: Constants.accessToken) ?? ""
    //        }
    //    }
}
