//
//  LiveContentModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit

struct LiveContentModel {
    let contentImage: UIImage
    let broadcastLabel: String
    let contentNameLabel: String
    let ratingLabel: String
}

extension LiveContentModel {
    static func dummy() -> [LiveContentModel] {
        return [
            LiveContentModel(contentImage: .live1, broadcastLabel: "tvN", contentNameLabel: "환승연애 18화", ratingLabel: "20.0%"),
            LiveContentModel(contentImage: .live2, broadcastLabel: "tvN", contentNameLabel: "눈물의 여왕 16화", ratingLabel: "24.0%"),
            LiveContentModel(contentImage: .live1, broadcastLabel: "tvN", contentNameLabel: "여고추리반 2화", ratingLabel: "20.0%"),
            LiveContentModel(contentImage: .live2, broadcastLabel: "SBS", contentNameLabel: "나는 SOLO", ratingLabel: "6.0%")
        ]
    }
}
