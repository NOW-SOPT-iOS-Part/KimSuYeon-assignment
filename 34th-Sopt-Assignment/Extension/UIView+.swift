//
//  UIView+.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/19/24.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
