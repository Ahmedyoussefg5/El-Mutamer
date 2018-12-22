//
//  customeCell.swift
//  Gawla
//
//  Created by Moe on 11/11/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class CustomCell: UIView{
    
    var cornerRadious :CGFloat = 5.0
    var shadowColor : UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    var shadowOffSetWeidth : Int = 0
    var shadowOffSetHeight : Int = 8
    var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = cornerRadious
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWeidth, height: shadowOffSetHeight)
        let shadowpath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
        layer.shadowPath = shadowpath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}



