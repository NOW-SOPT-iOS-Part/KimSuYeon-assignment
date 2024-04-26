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
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!"),
            FirstContentModel(contentImage: .poster2, contentNameLabel: "썸머 필름을 타고!")
        ]
    }
}
