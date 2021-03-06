//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
import SideMenu

class MoatamratSelectViewController: UIViewController {
    
    let latestCellIdentifier = "MoatamratSelectViewControllerCell"
    
    lazy var latesNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.register(MoatamratSelectViewControllerCell.self, forCellWithReuseIdentifier: latestCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        setupView()
        setupNavBar(title: "مؤتمرات")
        getData()
    }
    
    
    
    @objc func handleMenuTapped() {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    @objc func handleSearchTapped() {
        let searchViewController = SearchViewController()
        searchViewController.modalPresentationStyle = .custom
        present(searchViewController, animated: true, completion: nil)
    }
    
    fileprivate func setupView() {
        view.addSubview(latesNewsCollectionView)
        latesNewsCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 30, bottom: 20, right: 30))
    }
    
    var catData: [Item]? {
        didSet {
            latesNewsCollectionView.reloadData()
        }
    }
    private func getData() {
        GetDataFromApi.shared.getDataAPI(Categury.self, url: categoriesUrl) { (message, data) in
            if message == nil {
                if let data = data {
                    self.catData = data.data
                }
            }
        }
    }
}

extension MoatamratSelectViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestCellIdentifier, for: indexPath) as! MoatamratSelectViewControllerCell
        if let data = catData?[indexPath.row] {
            cell.configCell(data: data)
        }
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: latesNewsCollectionView.frame.width * 0.46, height: latesNewsCollectionView.frame.width * 0.46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let catId = catData?[indexPath.row].key {
            let vc = MoatamratViewController(catId: catId)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

class MoatamratSelectViewControllerCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setipView()
        isOpaque = false
        backgroundView = nil
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        layer.cornerRadius = 10
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let backView: UIImageView = {
        let view = UIImageView()
        //        view.layer.cornerRadius = 10
        //view.backgroundColor = .red
        return view
    }()
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
       // imgV.image = UIImage(named: "Layer 7")
        return imgV
    }()
    
    let cellSubName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 10)
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        
       // lbl.text = "شسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
        lbl.textColor = .red
        return lbl
    }()
    
    private func setipView() {
        contentView.addSubview(backView)
        backView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        
        contentView.addSubview(cellImageView)
        cellImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: backView.centerXAnchor, centerY: backView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        
        contentView.addSubview(cellSubName)
        cellSubName.anchorWithCenterXY(top: cellImageView.bottomAnchor, leading: backView.leadingAnchor, bottom: backView.bottomAnchor, trailing: backView.trailingAnchor, centerX: backView.centerXAnchor, centerY: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
    }
    
    func configCell(data: Item) {
        if let url = URL(string: data.icon) {
            cellImageView.kf.setImage(with: url)
        }
        if let urll = URL(string: data.bg) {
            backView.kf.setImage(with: urll)
        }
        cellSubName.text = data.name
    }
    
}
