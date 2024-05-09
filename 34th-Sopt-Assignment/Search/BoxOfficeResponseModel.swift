//
//  BoxOfficeResponseModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/9/24.
//

import Foundation

struct BoxOfficeResponseModel: Codable {
    let boxOfficeResponse: BoxOfficeResponse
}

struct BoxOfficeResponse: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String
}

enum RankOldAndNew: String, Codable {
    case new = "NEW"
    case old = "OLD"
}
