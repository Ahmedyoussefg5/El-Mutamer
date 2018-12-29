//
//  SideMenuTableViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class GalaryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

   var photosArray = [String]()
    
    func tableConfiger() {
        
        
        collectionView.backgroundColor = .white
        collectionView.isOpaque = false
        collectionView.backgroundView = nil
        //tableView.tableFooterView = UIView()
        collectionView.contentInset = .zero
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "galaryCell")

        
    }
    
    init(data: [String]) {
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .vertical
        super.init(collectionViewLayout: layOut)
        self.photosArray = data
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiger()
      //  self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galaryCell", for: indexPath)
        let cellImage = UIImageView()
        if let url = URL(string: photosArray[indexPath.row]) {
            cellImage.kf.setImage(with: url)
        }
        cell.addSubview(cellImage)
        cellImage.anchor(top: cell.topAnchor, leading: cell.leadingAnchor, bottom: cell.bottomAnchor, trailing: cell.trailingAnchor)
        
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width * 0.45, height: collectionView.frame.width * 0.45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 5, bottom: 5, right: 5)
    }
}




















