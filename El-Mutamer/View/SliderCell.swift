//
//  CategoryCell.swift
//  Tanta Services
//
//  Created by Youssef on 11/24/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class SliderCell : UICollectionViewCell {
    
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        //imgV.image = #imageLiteral(resourceName: "slider6")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        contentView.backgroundColor = .blue
    }
    
    
    func setupCell() {
        contentView.addSubview(cellImageView)
        cellImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
}


