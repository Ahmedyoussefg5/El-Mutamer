//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.contentSize.height = 3000
        //scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    let profileImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        imgV.image = UIImage(named: "Forma 1")
        imgV.layer.cornerRadius = 50
        //  imgV.layer.masksToBounds = true
        imgV.layer.applySketchShadow(color: .black19, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        return imgV
    }()
    let mailLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.CairoSemiBold(of: 12)
        let title = "asdasd@sdas.cosad"
        lable.textAlignment = .left
        lable.text = title
        return lable
    }()
    let phoneLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.CairoSemiBold(of: 12)
        let title = "43523423423"
        lable.textAlignment = .left
        lable.text = title
        return lable
    }()
    let locationLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.CairoSemiBold(of: 12)
        let title = "tanta, dfasdsa"
        lable.textAlignment = .left
        lable.text = title
        return lable
    }()
    let nameLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.CairoSemiBold(of: 12)
        let title = "ta sad asdas dfasdsa"
        lable.textAlignment = .center
        lable.text = title
        return lable
    }()
    let jobLable: UILabel = {
        let lable = UILabel()
        lable.textColor = #colorLiteral(red: 0.3803488016, green: 0.3804177642, blue: 0.3803390563, alpha: 1)
        lable.font = UIFont.CairoSemiBold(of: 10)
        let title = "tanta, dfasdsa"
        lable.textAlignment = .center
        lable.text = title
        return lable
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
    
    let trendsCellIdentifier = "mostSearchCell"
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)

        mailLable.text = AuthService.instance.userEmail
        phoneLable.text = AuthService.instance.userPhone
        nameLable.text = AuthService.instance.userName
        
        guard let url = URL(string: AuthService.instance.userImage ?? "") else { return }
        profileImageView.kf.setImage(with: url)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar(title: "حسابي")

    }
    
    

    
    fileprivate func setupView() {
        let mailImageView: UIImageView = {
            let imgV = UIImageView()
            imgV.contentMode = .scaleToFill
            imgV.image = UIImage(named: "Layer 7")
            return imgV
        }()
        
        let phoneImageView: UIImageView = {
            let imgV = UIImageView()
            imgV.contentMode = .scaleToFill
            imgV.image = UIImage(named: "Layer 7")
            return imgV
        }()
        
        let loactionImageView: UIImageView = {
            let imgV = UIImageView()
            imgV.contentMode = .scaleToFill
            imgV.image = UIImage(named: "Layer 7")
            return imgV
        }()
        
        
        
        let contView1: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.applySketchShadow(color: .black19, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
            return view
        }()
        let contView2: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.applySketchShadow(color: .black19, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
            return view
        }()
        let contView3: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.applySketchShadow(color: .black19, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
            return view
        }()
        


        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        let imgArray = [mailImageView, phoneImageView, loactionImageView]
        let txtArray = [mailLable, phoneLable, locationLable]
        let stack = UIStackView(arrangedSubviews: [contView1, contView2, contView3])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        for viewIndex in stack.arrangedSubviews.indices {
            stack.arrangedSubviews[viewIndex].addSubview(imgArray[viewIndex])
            imgArray[viewIndex].anchorWithCenterXY(top: nil, leading: stack.arrangedSubviews[viewIndex].leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: stack.arrangedSubviews[viewIndex].centerYAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 30, height: 25))
            
            stack.arrangedSubviews[viewIndex].addSubview(txtArray[viewIndex])
            txtArray[viewIndex].anchorWithCenterXY(top: nil, leading: imgArray[viewIndex].leadingAnchor, bottom: nil, trailing: stack.arrangedSubviews[viewIndex].trailingAnchor, centerX: nil, centerY: stack.arrangedSubviews[viewIndex].centerYAnchor, padding: .init(top: 0, left: 40, bottom: 0, right: 0), size: .init(width: 30, height: 25))
        }
        
        scrollView.addSubview(stack)
        stack.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 0, right: 0), size: .init(width: view.frame.width * 0.55, height: 150))
        
        scrollView.addSubview(profileImageView)
        profileImageView.anchor(top: scrollView.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 5), size: .init(width: 100, height: 100))
        
        scrollView.addSubview(nameLable)
        nameLable.anchorWithCenterXY(top: profileImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, centerX: profileImageView.centerXAnchor, centerY: nil,padding: .init(top: 10, left: 0, bottom: 0, right: 0) , size: .init(width: 120, height: 20))
        
        scrollView.addSubview(jobLable)
        jobLable.anchorWithCenterXY(top: nameLable.bottomAnchor, leading: nil, bottom: nil, trailing: nil, centerX: profileImageView.centerXAnchor, centerY: nil, size: .init(width: 100, height: 15))
        
        let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.8610689044, green: 0.08137863129, blue: 0, alpha: 1)
            return view
        }()

        scrollView.addSubview(lineView)
        lineView.anchorWithCenterXY(top: stack.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: nil,padding: .init(top: 8, left: 0, bottom: 0, right: 0) , size: .init(width: 0, height: 1))
        
        let joinLable: UILabel = {
            let lable = UILabel()
            lable.textColor = #colorLiteral(red: 0.8610689044, green: 0.08137863129, blue: 0, alpha: 1)
            lable.font = UIFont.CairoSemiBold(of: 12)
            let title = "المشاركات"
            lable.textAlignment = .right
            lable.text = title
            return lable
        }()
        scrollView.addSubview(joinLable)
        joinLable.anchorWithCenterXY(top: lineView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: nil,padding: .init(top: 7, left: 0, bottom: 0, right: 5) , size: .init(width: 0, height: 15))

        
        scrollView.addSubview(trendsCollectionView)
        trendsCollectionView.anchor(top: joinLable.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 7, left: 5, bottom: 5, right: 5), size: .init(width: 0, height: 0))
//


    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendsCellIdentifier, for: indexPath) as! TrendsCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 0
    }
    
    func profileViewController(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendsCellIdentifier, for: indexPath) as! TrendsCollectionViewCell
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: trendsCollectionView.frame.width - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let vc = ShopViewController(shopId: 1)
       // navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

