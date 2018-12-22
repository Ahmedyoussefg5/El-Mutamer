//
//  CategoryCell.swift
//  Tanta Services
//
//  Created by Youssef on 11/24/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import Foundation
import UIKit
//import Kingfisher

class TrendsCollectionViewCell : UICollectionViewCell {
    
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        imgV.image = UIImage(named: "Layer 7")
        return imgV
    }()
    
    let cellSubName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 14)
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.text = "شسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
        lbl.textColor = #colorLiteral(red: 0.9371561408, green: 0.9373133779, blue: 0.9371339679, alpha: 1)
        return lbl
    }()
    let companyImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "company name")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var companyNameLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "المصدي اليوم"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let dateImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "calender")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var companydateLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "12-21-1232"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let commentsImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "comment")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var commentsLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "777"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let seenImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "view")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var seenLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "777"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let likesImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "like")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var likesLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "128"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.blue
        setupView()


    }
    
    
    fileprivate func setupView() {
        
        contentView.addSubview(cellImageView)
        cellImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        
        contentView.addSubview(cellSubName)
        cellSubName.anchor(top: nil, leading: cellImageView.leadingAnchor, bottom: cellImageView.bottomAnchor, trailing: cellImageView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: 0, height: 15))
        
        contentView.addSubview(companyImageView)
        companyImageView.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 3, right: 3), size: .init(width: 15, height: 15))
        
        contentView.addSubview(companyNameLable)
        companyNameLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companyImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: contentView.frame.width * 0.23, height: 0))
        
        contentView.addSubview(dateImageView)
        dateImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companyNameLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: 15, height: 15))

        contentView.addSubview(companydateLable)
        companydateLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: dateImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: contentView.frame.width * 0.18, height: 0))
        
        contentView.addSubview(seenImageView)
        seenImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companydateLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: 15, height: 15))
        
        contentView.addSubview(seenLable)
        seenLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: seenImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: contentView.frame.width * 0.08, height: 0))
        
        contentView.addSubview(commentsImageView)
        commentsImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: seenLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: 15, height: 15))
        
        contentView.addSubview(commentsLable)
        commentsLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: commentsImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: contentView.frame.width * 0.08, height: 0))
        
        contentView.addSubview(likesImageView)
        likesImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: commentsLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: 15, height: 15))
        
        contentView.addSubview(likesLable)
        likesLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: likesImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: contentView.frame.width * 0.08, height: 0))
        
    }
    
    func setupCell(type: Int) {
        

        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
