//
//  StringExtension.swift
//  Motor Sports
//
//  Created by Youssef on 1/31/17.
//  Copyright © 2017 Youssef. All rights reserved.
//

//import Foundation
import UIKit

extension String {
    
    var trimmedString: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var removeTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
    
    var filterAsURL: String {
        return self.replacingOccurrences(of: "\\", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var localize: String {
        return NSLocalizedString(self, comment: "Hello From String Extension")
    }
    
    var isInt: Bool {
        return Int(self) != nil
    }
}

extension Bool {
    var toInt: Int {
        return NSNumber(booleanLiteral: self).intValue
    }
}

extension NSMutableAttributedString {
    
    func setupAttriutedLable(texts: [String], fonts: [UIFont], colors: [UIColor]) -> NSAttributedString {
        // multi line enable
        //* planOne.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let output = NSMutableAttributedString.init(string: texts.first ?? "", attributes: [.foregroundColor: colors.first ?? .black, .font: fonts.first ?? .systemFont(ofSize: 10), .paragraphStyle: paragraphStyle])
        guard texts.count > 1, texts.count == fonts.count, texts.count == colors.count else { return output }
        for index in texts.indices.dropFirst() {
            let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: colors[index], .font: fonts[index], .paragraphStyle: paragraphStyle]
            output.append(NSAttributedString(string: texts[index], attributes: attributes))
        }
        return output
    }
    
    convenience init(texts: [String], fonts: [UIFont], colors: [UIColor],_ alignment: NSTextAlignment = .center) {
        //* planOne.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        self.init(string: texts.first ?? "", attributes: [.foregroundColor: colors.first ?? .black, .font: fonts.first ?? .systemFont(ofSize: 10), .paragraphStyle: paragraphStyle])
        
        if texts.count > 1 && texts.count == fonts.count && texts.count == colors.count {
            for index in texts.indices.dropFirst() {
                let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: colors[index], .font: fonts[index], .paragraphStyle: paragraphStyle]
                self.append(NSAttributedString(string: texts[index], attributes: attributes))
            }
        }
    }
}
