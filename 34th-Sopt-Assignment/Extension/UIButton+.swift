//
//  UIButton+.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/6/24.
//

import UIKit

extension UIButton {
    func setTitle(_ title: String, titleColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
    }
    
    func setLayer(borderWidth: CGFloat = 0, borderColor: UIColor, cornerRadius: CGFloat) {
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
    }
    
    func underLineText() {
        let attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
