//
//  RecommendContentModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit

struct RecommendContentModel {
    let contentImage: UIImage
    let contentNameLabel: String
}

extension RecommendContentModel {
    static func dummy() -> [RecommendContentModel] {
        return [
            RecommendContentModel(contentImage: .poster1, contentNameLabel: "헤어질 결심"),
            RecommendContentModel(contentImage: .poster4, contentNameLabel: "너와 나"),
            RecommendContentModel(contentImage: .poster5, contentNameLabel: "사랑할 땐 누구나\n최악이 된다"),
            RecommendContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!")
        ]
    }
}
