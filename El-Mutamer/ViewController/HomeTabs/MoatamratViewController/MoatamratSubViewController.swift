//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class MoatamratViewController: UIViewController {
    
    let latestCellIdentifier = "categoryCell"
    lazy var latesNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.estimatedItemSize.height = UITableViewAutomaticDimension
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120.0
        layout.scrollDirection = .vertical
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.register(TrendsCollectionViewCell.self, forCellWithReuseIdentifier: latestCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        setupView()
        // setupNavBar(title: "مؤتمرات")
    }
    
    init(catId: Int) {
        super.init(nibName: nil, bundle: nil)
        getData(id: catId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleMenuTapped() {
        // present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    @objc func handleSearchTapped() {
        // let searchViewController = SearchViewController()
        // searchViewController.modalPresentationStyle = .custom
        // present(searchViewController, animated: true, completion: nil)
    }
    
    fileprivate func setupView() {
        view.addSubview(latesNewsCollectionView)
        latesNewsCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private var conferencesData: [Datum]? {
        didSet {
            latesNewsCollectionView.reloadData()
        }
    }
    fileprivate func getData(id: Int) {
        var url = gatAllMoatamrat
        url.append("\(id)")
        GetDataFromApi.shared.getDataAPI(Conferences.self, url: url) { (message, data) in
            if message == nil {
                if let data = data?.data {
                    self.conferencesData = data
                    
                }
            } else {
                print(message ?? "")
            }
        }
    }
}

extension MoatamratViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conferencesData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestCellIdentifier, for: indexPath) as! TrendsCollectionViewCell
        if let data = conferencesData?[indexPath.row] {
            cell.setupCell(data: data)
        }
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: latesNewsCollectionView.frame.width - 20, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = conferencesData?[indexPath.row] {
            let vc = ShopViewController(data: data)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

