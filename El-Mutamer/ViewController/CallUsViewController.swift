//
//  MoreAboutGawlaViewController.swift
//  Gawla
//
//  Created by Youssef on 12/19/18.
//  Copyright © 2018 ITGeeKs. All rights reserved.
//

import UIKit

class CallUsViewController: UIViewController {

    let nameLable: UserAccountLable = {
        let lable = UserAccountLable(text: "Your Name")
        return lable
    }()
    let mailLable: UserAccountLable = {
        let lable = UserAccountLable(text: "E-Mail")
        return lable
    }()
    let messageLable: UserAccountLable = {
        let lable = UserAccountLable(text: "Your Message")
        return lable
    }()

    let nameBox: UserAccountTextField = {
        let txt = UserAccountTextField(placeHolder: "Your Name".localize)
        return txt
    }()
    let mailBox: UserAccountTextField = {
        let txt = UserAccountTextField(placeHolder: "E-Mail".localize)
        return txt
    }()
    
    let messageTextView: UITextView = {
        let txtView = UITextView()
        txtView.backgroundColor = .paleGrey
        txtView.layer.cornerRadius = 8
        txtView.layer.borderWidth = 1
        txtView.layer.borderColor = UIColor.paleGreyTwo.cgColor
        txtView.font = .CairoBold(of: 14)
        txtView.textColor = .blueGrey
        txtView.textAlignment = .natural
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    
    let confirmButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 4
        btn.layer.borderColor = UIColor.waterBlue.cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = UIColor.red
        btn.layer.applySketchShadow(color: .darkSkyBlue41, alpha: 1, x: 0, y: 8, blur: 13, spread: 0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Send".localize, for: .normal)
        btn.titleLabel?.font = .CairoBold(of: 18)
        btn.titleLabel?.textColor = .white
        return btn
    }()
    
    override func loadView() {
        super.loadView()
        setupView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Call Us".localize
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.battleshipGrey, .font: UIFont.CairoBold(of: 16)]
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backChevron")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backChevron")
        navigationController?.navigationBar.topItem?.title = ""

    }
    
    private func setupView() {
        
        view.addSubview(nameLable)
        NSLayoutConstraint.activate([
            nameLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nameLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLable.heightAnchor.constraint(equalToConstant: 26)
            ])
        
        view.addSubview(nameBox)
        NSLayoutConstraint.activate([
            nameBox.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 2),
            nameBox.widthAnchor.constraint(equalTo: nameLable.widthAnchor, multiplier: 1.02),
            nameBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameBox.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        view.addSubview(mailLable)
        NSLayoutConstraint.activate([
            mailLable.topAnchor.constraint(equalTo: nameBox.bottomAnchor, constant: 10),
            mailLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            mailLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mailLable.heightAnchor.constraint(equalToConstant: 26)
            ])
        
        view.addSubview(mailBox)
        NSLayoutConstraint.activate([
            mailBox.topAnchor.constraint(equalTo: mailLable.bottomAnchor, constant: 2),
            mailBox.widthAnchor.constraint(equalTo: mailLable.widthAnchor, multiplier: 1.02),
            mailBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mailBox.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        view.addSubview(messageLable)
        NSLayoutConstraint.activate([
            messageLable.topAnchor.constraint(equalTo: mailBox.bottomAnchor, constant: 10),
            messageLable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            messageLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLable.heightAnchor.constraint(equalToConstant: 26)
            ])
        
        view.addSubview(messageTextView)
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: messageLable.bottomAnchor, constant: 2),
            messageTextView.widthAnchor.constraint(equalTo: mailLable.widthAnchor, multiplier: 1.02),
            messageTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
            ])
        
        view.addSubview(confirmButton)
        NSLayoutConstraint.activate([
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.widthAnchor.constraint(equalTo: messageTextView.widthAnchor, multiplier: 1),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            ])
    }
    


}
class UserAccountTextField: UITextField {
    init(placeHolder: String) {
        super.init(frame: .zero)
        self.backgroundColor = .paleGrey
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.paleGreyTwo.cgColor
        self.layer.cornerRadius = 8
        self.textColor = .blueGrey
        self.textAlignment = .natural
        self.font = UIFont.CairoBold(of: 14)
        
        self.attributedPlaceholder = NSAttributedString(string: placeHolder.localize, attributes: [.foregroundColor: #colorLiteral(red: 0.5019607843, green: 0.568627451, blue: 0.6470588235, alpha: 0.5)])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
class UserAccountLable: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.textColor = .blueGrey
        self.font = UIFont.CairoSemiBold(of: 14)
        self.textAlignment = .natural
        self.text = text.localize
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
class UserAccountButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        self.backgroundColor = .paleGrey
        self.setTitle(title.localize, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.paleGreyTwo.cgColor
        self.layer.cornerRadius = 8
        self.setTitleColor(.blueGrey, for: .normal)
        self.titleEdgeInsets = .init(top: 0, left: 7, bottom: 0, right: 7)
        self.contentHorizontalAlignment = .leading
        self.titleLabel?.font = UIFont.CairoBold(of: 14)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
