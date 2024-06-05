//
//  BoxOfficeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/10/24.
//

import UIKit
import SnapKit
import Then

final class BoxOfficeViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private var dailyBoxOfficeModelList: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        tableView.backgroundColor = .black
        
        setLayout()
        setDelegate()
        register()
        
        requestDailyBoxOfficeList()
    }
    
    private func requestDailyBoxOfficeList() {
        
        var date = ""
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        if let yesterday {
            date = format.string(from: yesterday)
        }
        
        BoxOfficeService.shared.dailyBoxOfficeList(date: date) { [weak self] response in switch response {
            case .success(let data):
                guard let data = data as? BoxOfficeResponseModel else {
                    return }
            self?.dailyBoxOfficeModelList = data.boxOfficeResult.dailyBoxOfficeList
            self?.tableView.reloadData()
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
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(
            BoxOfficeViewCell.self,
            forCellReuseIdentifier: BoxOfficeViewCell.identifier
        )
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BoxOfficeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension BoxOfficeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyBoxOfficeModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeViewCell.identifier, for: indexPath) as? BoxOfficeViewCell else { return UITableViewCell() }
        cell.dataBind(dailyBoxOfficeModelList[indexPath.row])
        return cell
    }
}
