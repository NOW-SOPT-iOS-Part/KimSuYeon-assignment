//
//  ContentModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/25/24.
//

import UIKit

struct TivingContentModel {
    let contentImage: UIImage
    let contentNameLabel: String
}

extension TivingContentModel {
    static func dummy() -> [TivingContentModel] {
        return [
            TivingContentModel(contentImage: .poster1, contentNameLabel: "헤어질 결심"),
            TivingContentModel(contentImage: .poster4, contentNameLabel: "너와 나"),
            TivingContentModel(contentImage: .poster5, contentNameLabel: "사랑할 땐 누구나\n최악이 된다"),
            TivingContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!")
        ]
    }
}
