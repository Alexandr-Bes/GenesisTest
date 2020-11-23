//
//  UIView+Extension.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 19.11.2020.
//

import UIKit

extension UIView {
    func addConstraintsToSafeArea() {
        guard let superView = self.superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
            self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addConstraintsToSafeAreaWithoutBottom() {
        guard let superView = self.superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
            self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
