//
//  UIView+Ext.swift
//  Werdd
//
//  Created by Mark Martin on 10/15/22.
//

import UIKit

extension UIView {
    func activate(constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func constrain(within view: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        activate(constraints: [
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right),
        ])
    }
}
