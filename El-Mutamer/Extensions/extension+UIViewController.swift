//
//  Alert.swift
//  Champione Arena
//
//  Created by Youssef on 9/16/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

extension UIViewController {
    
    func showAlert(title : String, messages : [String]?, message: String?, selfDismissing: Bool) {
        
        var messageContent = ""
        
        if let messages = messages {
            for message in messages {
                messageContent += message + "\n"
            }
        }
        
        if let message = message {
            messageContent = message
        }
        
        let alert = UIAlertController(title: title, message: messageContent, preferredStyle: .alert)
        
        
        if !selfDismissing {
            let title = NSLocalizedString("OK".localize, comment: "Any")
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
        }
        
        present(alert, animated: true)
        
        if selfDismissing {
//            let deadlineTime = DispatchTime.now() + .seconds(2)
//            DispatchQueue.main.asyncAfter(deadline: deadlineTime) { [weak self] in
//                alert.dismiss(animated: true)
//            }
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (t) in
                alert.dismiss(animated: true)
            }
        }
    }
    
    
    func showConnectionErrorAlert(_ title : String?,_ message: String?, selfDismissing: Bool) {
        
        var messageTitle = "Connection Error".localize
        var messageContent = "Check Your Internet Connection!".localize

        if let title = title {
            messageTitle = title
        }
        
        if let message = message {
            messageContent = message
        }
        
        let alert = UIAlertController(title: messageTitle, message: messageContent, preferredStyle: .alert)
        
        
        if !selfDismissing {
            let title = NSLocalizedString("OK".localize, comment: "Any")
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
        }
        
        present(alert, animated: true)
        
        if selfDismissing {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (t) in
                alert.dismiss(animated: true)
            }
        }
    }

    
    func interactionConfig(with indicator: UIActivityIndicatorView, to status: Bool) {
        if status {
            indicator.isHidden = false
            indicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        } else {
            indicator.isHidden = true
            indicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func getCurrentDeviceLanguage() -> String {
        if let langStr = Locale.current.languageCode {
            return langStr
        }
        return "en"
    }
    
    func setupNavBar(title: String)  {
        navigationItem.title = title
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.878074348, green: 0.2536863685, blue: 0.2426855266, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: UIFont.CairoBold(of: 15)]
        navigationController?.navigationBar.isTranslucent = false
        
        // items
        let menuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "slide menue"), landscapeImagePhone: #imageLiteral(resourceName: "slide menue"), style: .plain, target: self, action: #selector(handleMenu))
       navigationItem.rightBarButtonItem = menuButton
        let searchImage = UIImage(named: "searchsearch")
        let searchButton = UIBarButtonItem(image: searchImage, landscapeImagePhone: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        navigationItem.leftBarButtonItem = searchButton
        
        setupSideMenu()
    }
    
    @objc private func handleMenu() {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    @objc private func handleSearch() {
        let searchViewController = SearchViewController()
        searchViewController.modalPresentationStyle = .custom
        present(searchViewController, animated: true, completion: nil)
    }
    
    fileprivate func setupSideMenu() {
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: SideMenuTableViewController())

        //menuRightNavigationController.delegate = self as? UINavigationControllerDelegate

        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        //  SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.view)
        //  SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
        // (Optional) Prevent status bar area from turning black when menu appears:
        SideMenuManager.default.menuFadeStatusBar = false
    }

}
