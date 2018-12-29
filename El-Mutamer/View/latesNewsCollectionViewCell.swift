//
//  CategoryCell.swift
//  Tanta Services
//
//  Created by Youssef on 11/24/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import Foundation
import UIKit

class LatesNewsCollectionView : UICollectionViewCell {
    
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        //imgV.image = UIImage(named: "Layer 7")
        return imgV
    }()
    
    let cellBackView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellSubName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 14)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        //lbl.text = "شسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
        lbl.textColor = .white
        return lbl
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupView()
        
        
    }
    
    
    fileprivate func setupView() {
        contentView.addSubview(cellImageView)
        cellImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .zero)
        
        contentView.addSubview(cellBackView)
        cellBackView.anchorWithCenterXY(top: nil, leading: cellImageView.leadingAnchor, bottom: cellImageView.bottomAnchor, trailing: cellImageView.trailingAnchor, centerX: nil, centerY: nil, padding: .zero, size: .init(width: 0, height: contentView.frame.height * 0.35))
        
        cellBackView.addSubview(cellSubName)
        cellSubName.anchor(top: nil, leading: cellBackView.leadingAnchor, bottom: cellImageView.bottomAnchor, trailing: cellBackView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 15, right: 0), size: .init(width: 0, height: 10))
        
        
        
    }
    
    func setupCell(data: Datum) {
        if let url = data.mainImage, let imgUrl = URL(string: url) {
            cellImageView.kf.indicatorType = .activity
            cellImageView.kf.setImage(with: imgUrl)
        }
        if let title = data.title {
            cellSubName.text = title
        }
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
