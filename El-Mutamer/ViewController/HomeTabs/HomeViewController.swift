//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.contentSize.height = 3000
        //scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    lazy var sliderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.isPagingEnabled = true
        collV.backgroundColor = .white
        collV.register(SliderCell.self, forCellWithReuseIdentifier: sliderCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    lazy var pageControl: UIPageControl = {
        let pager = UIPageControl()
        pager.currentPage = 0
        pager.numberOfPages = 10
        pager.currentPageIndicatorTintColor = .white
        pager.pageIndicatorTintColor = #colorLiteral(red: 0.4352941176, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        pager.backgroundColor = .clear
        return pager
    }()
    
    lazy var latesNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.estimatedItemSize.height = UITableViewAutomaticDimension
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120.0
        layout.scrollDirection = .horizontal
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.register(LatesNewsCollectionView.self, forCellWithReuseIdentifier: latestCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    lazy var trendsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.isScrollEnabled = false
        collV.register(TrendsCollectionViewCell.self, forCellWithReuseIdentifier: trendsCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        collV.showsVerticalScrollIndicator = false
        return collV
    }()
    
    let sliderCellIdentifier = "sliderCell"
    let latestCellIdentifier = "categoryCell"
    let trendsCellIdentifier = "mostSearchCell"
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar(title: "الرئيسبة")

    }
    
    
    @objc func moveToNextPage () {
        let nextIndexPath: IndexPath
        let currentPage = pageControl.currentPage
        if currentPage == pageControl.numberOfPages - 1 {
            nextIndexPath = IndexPath(row: 0, section: 0)
        } else {
            nextIndexPath = IndexPath(row: currentPage + 1, section: 0)
        }
        sliderCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
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
        let latestNewsLable: UILabel = {
            let lable = UILabel()
            lable.textColor = .black
            lable.font = UIFont.CairoSemiBold(of: 17)
            let title = "اخر الاحداث"
            lable.textAlignment = .right
            lable.text = title
            return lable
        }()
        let trendsLable: UILabel = {
            let lable = UILabel()
            lable.textColor = .black
            lable.font = UIFont.CairoSemiBold(of: 17)
            let title = "اهم المؤتمرات والمعارض"
            lable.textAlignment = .right
            lable.text = title
            return lable
        }()
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        scrollView.addSubview(sliderCollectionView)
        sliderCollectionView.anchorWithCenterXY(top: scrollView.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.3))
        
        scrollView.addSubview(pageControl)
        pageControl.anchorWithCenterXY(top: nil, leading: sliderCollectionView.leadingAnchor, bottom: sliderCollectionView.bottomAnchor, trailing: sliderCollectionView.trailingAnchor, centerX: nil, centerY: nil, padding: .zero, size: .init(width: sliderCollectionView.frame.width, height: 20))
        
        scrollView.addSubview(latesNewsCollectionView)
        latesNewsCollectionView.anchor(top: sliderCollectionView.bottomAnchor, leading: sliderCollectionView.leadingAnchor, bottom: nil, trailing: sliderCollectionView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: view.frame.height * 0.15))
        
        scrollView.addSubview(trendsCollectionView)
        trendsCollectionView.anchor(top: latesNewsCollectionView.bottomAnchor, leading: sliderCollectionView.leadingAnchor, bottom: view.bottomAnchor, trailing: sliderCollectionView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        
        scrollView.addSubview(latestNewsLable)
        latestNewsLable.anchor(top: nil, leading: sliderCollectionView.leadingAnchor, bottom: latesNewsCollectionView.topAnchor, trailing: latesNewsCollectionView.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 3, right: 5), size: .init(width: 0, height: 20))
        scrollView.addSubview(trendsLable)
        trendsLable.anchor(top: nil, leading: view.leadingAnchor, bottom: trendsCollectionView.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 1, right: 5), size: .init(width: 0, height: 20))
    }

}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return 10
        } else {
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sliderCollectionView {
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: sliderCellIdentifier, for: indexPath) as! SliderCell
            cell.cellImageView.image = nil
            return cell
        }
        
       else if collectionView == latesNewsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestCellIdentifier, for: indexPath) as! LatesNewsCollectionView
            return cell
        }
        
       else if collectionView == trendsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendsCellIdentifier, for: indexPath) as! TrendsCollectionViewCell
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionView {
            return 0
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView {
            return .init(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
        } else if collectionView == latesNewsCollectionView {
            return .init(width: latesNewsCollectionView.frame.width * 0.35, height: latesNewsCollectionView.frame.height)
        } else if collectionView == trendsCollectionView {
            return .init(width: trendsCollectionView.frame.width - 20, height: 150)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == latesNewsCollectionView {
            return .init(top: 0, left: 5, bottom: 0, right: 5)
        } else if collectionView == trendsCollectionView {
            return .init(top: 10, left: 10, bottom: 10, right: 10)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == sliderCollectionView {
            let currentPage = indexPath.row
            pageControl.currentPage = currentPage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}

