//
//  AppDelegateProvider.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//

import UIKit

class AppDelegateProvider {
    func provide() -> AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("App Delegate nil ?")
        }
        return appDelegate
    }
}
