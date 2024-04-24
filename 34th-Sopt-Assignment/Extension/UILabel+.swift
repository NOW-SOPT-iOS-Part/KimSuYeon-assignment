//
//  UILabel+.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation
import UIKit

extension UILabel {
    
    func underLineText(forText: String) {
        guard let labelText = self.text else { return }
        
        let rangeToUnderLine = (labelText as NSString).range(of: forText)
        
        let underLineText = NSMutableAttributedString(string: labelText)
        underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.attributedText = underLineText
    }
}
