//
//  ViewController.swift
//  El-Mutamer
//
//  Created by Youssef on 12/16/18.
//  Copyright © 2018 ITGeeKs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let backImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "background")
        return img
    }()
    let logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "login logo")
        img.contentMode = .scaleToFill
        return img
    }()
    let mailTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "الايميل"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.textAlignment = .center
        txt.backgroundColor = .white
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "email"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    let passTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "كلمة المرور"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.backgroundColor = .white
        txt.textAlignment = .center
        txt.isSecureTextEntry = true
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "lock"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7264127135, green: 0.2071290016, blue: 0.206894666, alpha: 1)
        btn.setTitle("تسجيل الدخول", for: .normal)
        return btn
    }()
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7264127135, green: 0.2071290016, blue: 0.206894666, alpha: 1)
        btn.setTitle("التسجيل", for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backImage)
        backImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
        
        view.addSubview(logoImg)
        logoImg.anchorWithCenterXY(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 100, left: 0, bottom: 0, right: 0), size: CGSize.init(width: 180, height: 80))
        
        let stack = UIStackView(arrangedSubviews: [mailTxt, passTxt])
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        view.addSubview(stack)
        stack.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor, padding: .zero, size: .init(width: view.frame.width * 0.8, height: 90))
        
        view.addSubview(registerButton)
        registerButton.anchorWithCenterXY(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .zero, size: .init(width: 0, height: 50))
        
        view.addSubview(loginButton)
        loginButton.anchorWithCenterXY(top: stack.bottomAnchor, leading: stack.leadingAnchor, bottom: nil, trailing: stack.trailingAnchor, centerX: stack.centerXAnchor, centerY: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        registerButton.addTarget(self, action: #selector(showRegisterViewController), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        mailTxt.layer.cornerRadius = 20
        passTxt.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
    }
    
    @objc private func showRegisterViewController() {
        let registerViewController = RegisterViewController()
        present(registerViewController, animated: true, completion: nil)
    }
    @objc private func loginUser() {
       let homeVC = HomeTabBarController()
        present(homeVC, animated: true, completion: nil)
        
    }
}

