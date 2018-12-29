//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
//import SideMenu

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isToolbarHidden = false
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let moatamratViewController = UINavigationController(rootViewController: MoatamratSelectViewController())
        //let maaredViewController = UINavigationController(rootViewController: MaaredSelectViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())

        homeViewController.tabBarItem = UITabBarItem(title: "الرئسية", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
        moatamratViewController.tabBarItem = UITabBarItem(title: "المؤتمرات", image: #imageLiteral(resourceName: "moatamer"), selectedImage: #imageLiteral(resourceName: "moatamer"))
       // maaredViewController.tabBarItem = UITabBarItem(title: "معارض", image: #imageLiteral(resourceName: "ma3rad"), selectedImage: #imageLiteral(resourceName: "ma3rad"))
        profileViewController.tabBarItem = UITabBarItem(title: "حسابي", image: #imageLiteral(resourceName: "mail"), selectedImage: #imageLiteral(resourceName: "mail"))


        //tabBarController?.selectedViewController = homeViewController
        
        let tabBarList = [profileViewController, moatamratViewController, homeViewController]
        viewControllers = tabBarList
        
        selectedViewController = tabBarList[2]
        
        

    }

    

}

