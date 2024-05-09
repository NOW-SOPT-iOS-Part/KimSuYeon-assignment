//
//  BoxOfficeTargetType.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/9/24.
//

import Foundation
import Moya

enum BoxOfficeTargetType {
    case dailyBoxOfficeList(date: String)
}

extension BoxOfficeTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .dailyBoxOfficeList:
            return "/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dailyBoxOfficeList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .dailyBoxOfficeList(let date):
            let parameters: [String: Any] = [
                "key": Config.apiKey,
                "targetDt": date
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .dailyBoxOfficeList:
            return ["Content-Type": "application/json"]
        }
    }
}

