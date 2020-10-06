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
        let codeSuffix = "&state=\(UUID().uuidString)"
        if newUrlString.hasPrefix(Constants.redirectURI) && newUrlString.hasSuffix(codeSuffix) {
            newUrlString = newUrlString.replacingOccurrences(of: Constants.redirectURI, with: "")
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
}
