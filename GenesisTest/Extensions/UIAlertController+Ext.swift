//
//  UIAlertController+Ext.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func showAlert(in viewController: UIViewController?,
                          withAnimation: Bool = true,
                          title: String? = nil,
                          message: String? = nil,
                          closeTitle: String? = "Close",
                          _ closeClouser:(()->())? = nil,
                          acceptTitle: String? = nil,
                          _ acceptClouser:(()->())? = nil)
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction.init(title: closeTitle, style: .cancel) { (action) in
            if let _clouser = closeClouser {
                _clouser()
            }
        }
        alert.addAction(closeAction)
        if let _acceptTitle = acceptTitle {
            let acceptAction = UIAlertAction.init(title: _acceptTitle, style: .default) { (action) in
                if let _clouser = acceptClouser {
                    _clouser()
                }
            }
            alert.addAction(acceptAction)
        }
        
        viewController?.present(alert, animated: withAnimation)
    }
}
