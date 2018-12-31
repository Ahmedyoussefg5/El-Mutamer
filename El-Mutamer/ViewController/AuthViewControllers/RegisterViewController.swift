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
    
    let profileImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        imgV.image = UIImage(named: "Forma 1")
        imgV.layer.cornerRadius = 50
        //  imgV.layer.masksToBounds = true
        imgV.layer.applySketchShadow(color: .black19, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        return imgV
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
        let placeholder = "الوظيفة"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.textAlignment = .center
        txt.backgroundColor = .white
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "phone"), colorSeparator: .clear, colorBorder: .clear)
        return txt
    }()
    
    let addressTxt: UITextField = {
        let txt = UITextField()
        let placeholder = "العنوان"
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)])
        txt.font = UIFont.CairoSemiBold(of: 18)
        txt.backgroundColor = .white
        txt.textAlignment = .center
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "loci"), colorSeparator: .clear, colorBorder: .clear)
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
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: backImage.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [nameTxt, mailTxt, phoneTxt, jobTxt, addressTxt, passTxt, passConfirmTxt])
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
        registerButton.addTarget(self, action: #selector(regUser), for: .touchUpInside)
        profileImageView.isUserInteractionEnabled = true
        let tab = UITapGestureRecognizer(target: self, action: #selector(handleSelectImage))
        profileImageView.addGestureRecognizer(tab)
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
    
    let userImagePicker = UIImagePickerController()
    @objc private func handleSelectImage() {
        //let picker = UIImagePickerController()
        userImagePicker.allowsEditing = true
        userImagePicker.sourceType = .photoLibrary
        userImagePicker.delegate = self
        self.present(userImagePicker, animated: true, completion: nil)
    }
    
    
    var userImage: UIImage? {
        didSet {
            profileImageView.image = userImage
        }
    }
    
    
    @objc private func regUser() {
        guard let name = nameTxt.text else { return }
        guard let mail = mailTxt.text else { return }
        guard let phone = phoneTxt.text else { return }
        guard let pass = passTxt.text, let passs = passConfirmTxt.text, pass == passs else { return }
        guard let job = jobTxt.text else { return }
        guard let address = addressTxt.text else { return }

        guard let img =  userImage?.kf.jpegRepresentation(compressionQuality: 0.5) else { return }
        let userBase64Str = img.base64EncodedString(options: .lineLength64Characters)
        
        var header1 = "data:image/jpeg;base64,"
        header1.append(contentsOf: userBase64Str)

        
        let parameters: [String: Any] = [
            "name": name,
            "email" : mail,
            "phone" : phone,
            "password" : pass,
            "password_confirmation" : pass,
            "img" : header1,
            "carrer" : job,
            "adress" : address,
            "type" : 1
        ]

        GetDataFromApi.shared.getDataAPI(RegUser.self, url: "http://beta.conferencenews.news/api/register", .post, parameters) { (message, data) in
            if message == nil {
                guard let data = data else { return }
                if data.success {
                    guard let userData = data.data else { return }
                    AuthService.instance.authToken = userData.token
                    AuthService.instance.userEmail = userData.userdata.email
                    AuthService.instance.userImage = userData.userdata.img
                    AuthService.instance.userPhone = userData.userdata.phone
                    AuthService.instance.userName = userData.userdata.name
                    
                    let homeVC = HomeTabBarController()
                    self.present(homeVC, animated: true, completion: nil)
                } else {
                    self.showAlert(title: data.message, messages: nil, message: nil, selfDismissing: false)
                }
            } else {
                self.showAlert(title: message ?? "Error Happend", messages: nil, message: nil, selfDismissing: false)
            }
        }
        



    }
    
    @objc private func dismissMe() {
        dismiss(animated: true, completion: nil)
        
    }

}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
            if let editedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage {
                self.userImage = editedImage
            } else if let originalImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
                self.userImage = originalImage
            }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
