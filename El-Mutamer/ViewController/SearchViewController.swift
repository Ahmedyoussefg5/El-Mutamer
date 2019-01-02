//
//  SearchViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let backButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.backgroundColor = .clear
        txt.setImage(#imageLiteral(resourceName: "backChevron"), for: .normal)
        // txt.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5)
        return txt
    }()
    
    let banerImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = #imageLiteral(resourceName: "login logo")
        return imgV
    }()
    lazy var searchTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.layer.cornerRadius = 20.0
        txt.backgroundColor = #colorLiteral(red: 0.8430479169, green: 0.8431901932, blue: 0.8430278897, alpha: 1)
        txt.textAlignment = .right
        txt.keyboardType = .webSearch
        txt.font = UIFont.CairoSemiBold(of: 16)
        txt.withImage(direction: .Right, image: #imageLiteral(resourceName: "searchsearch"), colorSeparator: .clear, colorBorder: .clear)
        let placeholder = "البحث"
        txt.placeholder = placeholder
       // txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4352941176, green: 0.231372549, blue: 0.5843137255, alpha: 1)])
        return txt
    }()
    
    lazy var itemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.estimatedItemSize.height = UITableViewAutomaticDimension
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120.0
        //layout.scrollDirection = .vertical
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.register(TrendsCollectionViewCell.self, forCellWithReuseIdentifier: "itemCellIdentifier")
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        backButton.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {        
        guard let key = searchTextField.text, key.count > 2 else { return }
        searchCancelingPastQuery()
        getDataWith(Search: key)
    }
    
    fileprivate func setupLayout() {
        view.addSubview(banerImageView)
        banerImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.frame.height * 0.27))
        
        view.addSubview(backButton)
        backButton.anchor(top: banerImageView.topAnchor, leading: banerImageView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        view.addSubview(searchTextField)
        searchTextField.anchorWithCenterXY(top: backButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width * 0.9, height: 40))
        
        view.addSubview(itemCollectionView)
        itemCollectionView.anchorWithCenterXY(top: banerImageView.bottomAnchor, leading: nil, bottom: view.bottomAnchor, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width * 0.9, height: 0))
        
    }
    @objc func handleBackTapped() {
        dismiss(animated: true)
    }
    
    var itemData: [Datum]?
    
    func getDataWith(Search Key: String) {
        
        let url = "http://beta.conferencenews.news/api/search?searchWord=\(Key)"
         guard let urlwithPercentEscapes = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        GetDataFromApi.shared.getDataAPI(Conferences.self, url: urlwithPercentEscapes) { (message, data) in
            if message == nil {
                if let data = data?.data {
                    self.itemData = data
                    self.itemCollectionView.reloadData()
                }
            } else {
                print(message ?? "")
            }
        }
    }
    
    // We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?
    private func searchCancelingPastQuery() {
        // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()
        
        // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.getDataWith(Search: self?.searchTextField.text ?? "")
        }
        
        // Save the new work item and execute it after 250 ms
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(150),
                                      execute: requestWorkItem)
    }
    
    
    
}



extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCellIdentifier", for: indexPath) as! TrendsCollectionViewCell
        if let data = itemData?[indexPath.row] {
            cell.setupCell(data: data)
            return cell
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: itemCollectionView.frame.width - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = itemData?[indexPath.row] {
            let vc = ShopViewController(data: data)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
















