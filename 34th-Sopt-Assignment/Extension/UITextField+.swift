//
//  UITextField+.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation
import UIKit

extension UITextField {
    func setText(placeholder: String, textColor: UIColor, backgroundColor: UIColor, placeholderColor: UIColor) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [.foregroundColor: placeholderColor]
        )
    }
    
    func setLayer(borderWidth: CGFloat = 0, borderColor: UIColor, cornerRadius: CGFloat) {
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
    }
    
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
