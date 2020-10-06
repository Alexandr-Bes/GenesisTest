//
//  Constants.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 29.09.2020.
//

import Foundation
import UIKit

class Constants {
    static let clientId = "fa759a9f35a3e3c4958a"
    static let clientSecret = "06abb63f26d76864ba543db5c55fe98210fafb5c"
    static let redirectURL = "https://github.com/Alexandr-Bes/GenesisTest"
    static let scope = "read:user,user:email"
//    static let id = UIDevice.current.identifierForVendor?.uuidString
    static let randomString = "\(Int.random(in: 1000000...9999999))"
    static let accessToken = "accessToken"
}
