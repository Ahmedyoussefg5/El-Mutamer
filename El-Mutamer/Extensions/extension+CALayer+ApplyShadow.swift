//
//  File.swift
//  Gawla
//
//  Created by Youssef on 11/6/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

extension CALayer {
    
    //                                      Apply Shadow to any layer
    //loginBtn.layer.shadowRadius = 8.0
    //loginBtn.layer.cornerRadius = 10.0
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    
   
}

                        // addInnerShadow
extension UIView {
    public func addInnerShadow(topColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = 10.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
}

