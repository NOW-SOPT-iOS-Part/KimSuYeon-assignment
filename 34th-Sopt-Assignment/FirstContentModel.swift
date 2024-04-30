//
//  ContentModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/25/24.
//

import UIKit

struct FirstContentModel {
    let contentImage: UIImage
    let contentNameLabel: String
}

extension FirstContentModel {
    static func dummy() -> [FirstContentModel] {
        return [
            FirstContentModel(contentImage: .poster1, contentNameLabel: "헤어질 결심"),
            FirstContentModel(contentImage: .poster4, contentNameLabel: "너와 나"),
            FirstContentModel(contentImage: .poster5, contentNameLabel: "사랑할 땐 누구나\n최악이 된다"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster3, contentNameLabel: "혐오스런 마츠코의\n일생")
        ]
    }
}
