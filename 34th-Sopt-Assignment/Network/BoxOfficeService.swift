//
//  BoxOfficeService.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/10/24.
//

import Foundation
import Moya

final class BoxOfficeService {
    static let shared = BoxOfficeService()
    private var boxOfficeProvider = MoyaProvider<BoxOfficeTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension BoxOfficeService {
    func dailyBoxOfficeList(date: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        boxOfficeProvider.request(.dailyBoxOfficeList(date: date)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, BoxOfficeResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}
