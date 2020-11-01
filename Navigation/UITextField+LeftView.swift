//
//  UITextField+LeftView.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// Method adds left indent for text into text field.
    ///
    /// - Parameters:
    ///   - width: Left indent
    func insertLeftIndent(_ width: CGFloat = 10) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: frame.height))
        leftViewMode = .always
    }
}
