//
//  UITextField+.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation
import UIKit

extension UITextField {
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
    
    //placeholder 세팅 커스텀
    func setPlaceholder(placeholder: String, fontColor: UIColor?) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: fontColor!])
    }
}
