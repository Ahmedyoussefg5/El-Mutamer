

import UIKit
extension UIButton {
    func addTrailingImageView(image: UIImage, width: CGFloat, hight: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: hight),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }
}


extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
            //                      add image to textfield               \\
    
    func withImage (direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 8
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }
}
extension UILabel{
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : self.font
            ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

