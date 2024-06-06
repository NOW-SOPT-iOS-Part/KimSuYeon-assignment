//
//  SearchViewModel.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/7/24.
//

import UIKit

final class SearchViewModel {
    
    // MARK: - Properties
    
    var dailyBoxOfficeModelList: [DailyBoxOfficeList] = [] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (() -> Void)?
    
    // MARK: - Network
    
    func requestDailyBoxOfficeList() {
        var date = ""
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        if let yesterday {
            date = format.string(from: yesterday)
        }
        
        BoxOfficeService.shared.dailyBoxOfficeList(date: date) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? BoxOfficeResponseModel else {
                    return
                }
                self?.dailyBoxOfficeModelList = data.boxOfficeResult.dailyBoxOfficeList
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
}
