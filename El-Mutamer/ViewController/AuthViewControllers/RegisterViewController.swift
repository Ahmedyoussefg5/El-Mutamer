//
//  ViewController.swift
//  El-Mutamer
//
//  Created by Youssef on 12/16/18.
//  Copyright © 2018 ITGeeKs. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    let backImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "background")
        return img
    }()
    let nameTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "الاسم"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.textAlignment = .center
        txt.backgroundColor = .white
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "name"), colorSeparator: .clear, colorBorder: .clear)
        return txt
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
    let phoneTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "رقم الهاتف"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.textAlignment = .center
        txt.backgroundColor = .white
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "phone"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    let jobTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "رقم الهاتف"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.textAlignment = .center
        txt.backgroundColor = .white
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "phone"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    let addressTxt: UIButton = {
        let txt = UIButton()
        let title = "العنوان"
        let attTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.setAttributedTitle(attTitle, for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 18)
        txt.contentHorizontalAlignment = .center
        txt.backgroundColor = .white
        txt.addTrailingImageView(image: .init(imageLiteralResourceName: "loci"), width: 22, hight: 22)
      //  (direction: .Right, image: .init(imageLiteralResourceName: "phone"), colorSeparator: .clear, colorBorder: .clear)
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
    let passConfirmTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "اعادة كلمة المرور "
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.backgroundColor = .white
        txt.textAlignment = .center
        txt.isSecureTextEntry = true
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "lock"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7264127135, green: 0.2071290016, blue: 0.206894666, alpha: 1)
        btn.setTitle("تسجيل", for: .normal)
        return btn
    }()
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.7264127135, green: 0.2071290016, blue: 0.206894666, alpha: 1)
        btn.setTitle("تسجيل الدخول", for: .normal)
        return btn
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backImage)
        backImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
        
        let stack = UIStackView(arrangedSubviews: [nameTxt, mailTxt, phoneTxt,jobTxt, addressTxt, passTxt, passConfirmTxt])
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        view.addSubview(stack)
        stack.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor, padding: .zero, size: .init(width: view.frame.width * 0.8, height: 300))
        
        view.addSubview(loginButton)
        loginButton.anchorWithCenterXY(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .zero, size: .init(width: 0, height: 50))
        
        view.addSubview(registerButton)
        registerButton.anchorWithCenterXY(top: stack.bottomAnchor, leading: stack.leadingAnchor, bottom: nil, trailing: stack.trailingAnchor, centerX: stack.centerXAnchor, centerY: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        loginButton.addTarget(self, action: #selector(dismissMe), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTxt.layer.cornerRadius = 18
        mailTxt.layer.cornerRadius = 18
        phoneTxt.layer.cornerRadius = 18
        passTxt.layer.cornerRadius = 18
        passConfirmTxt.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 20
        jobTxt.layer.cornerRadius = 18
        addressTxt.layer.cornerRadius = 18
    }
    
    @objc private func dismissMe() {
        dismiss(animated: true, completion: nil)
        
    }

}

