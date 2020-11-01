//
//  UIView+RoundedShadow.swift
//  Netology_Lesson_6_TableView_ScrollView
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Method adds shadow and corner radius for top of view by default.
    ///
    /// - Parameters:
    ///   - radius: Corner radius
    ///   - top: Top corners
    ///   - bottom: Bottom corners
    ///   - shadowEnabled: Shadow On
    ///   - shadowOffset: Shadow offset
    ///   - shadowRadius: Shadow radius
    ///   - shadowColor: Shadow color
    ///   - shadowOpacity: Shadow opacity
    func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true, shadowOffset: CGSize = CGSize(width: 4, height: 4), shadowRadius: CGFloat = CGFloat(4), shadowColor: CGColor? = UIColor.black.cgColor, shadowOpacity: Float = 0.7 ) {
  
        var maskedCorners = CACornerMask()
        
        if shadowEnabled {
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
            layer.shadowColor = shadowColor
            layer.shadowRadius = shadowRadius
            layer.shadowOffset = shadowOffset
        }
        
        switch (top, bottom) {
        case (true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false, true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
    
    /// Method adds shadow path.
    ///
    /// - Parameters:
    ///   - shadowOffset: Shadow offset
    func setShadowPath(_ shadowOffset: CGSize = CGSize(width: 4, height: 4)) {
        let contactShadowSize = CGRect(x: layer.bounds.minX, y: layer.bounds.minY, width: layer.bounds.width + shadowOffset.width, height: layer.bounds.height + shadowOffset.height)
        
        layer.shadowPath = UIBezierPath(rect: contactShadowSize).cgPath
    }
}
