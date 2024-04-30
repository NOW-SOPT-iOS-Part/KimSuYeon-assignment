//
//  SecondContentModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit

struct SecondContentModel {
    let contentImage: UIImage
    let contentNameLabel: String
}

extension SecondContentModel {
    static func dummy() -> [SecondContentModel] {
        return [
            SecondContentModel(contentImage: .poster1, contentNameLabel: "헤어질 결심"),
            SecondContentModel(contentImage: .poster4, contentNameLabel: "너와 나"),
            SecondContentModel(contentImage: .poster5, contentNameLabel: "사랑할 땐 누구나\n최악이 된다"),
            SecondContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!")
        ]
    }
}
