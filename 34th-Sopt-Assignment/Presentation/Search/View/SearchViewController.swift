//
//  SearchViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/7/24.
//

import UIKit
import SnapKit
import Then

final class SearchViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = SearchView()
    
    private var dailyBoxOfficeModelList: [DailyBoxOfficeList] = []
    
    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
        
        requestDailyBoxOfficeList()
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        setDelegate()
        
        setTarget()
    }
    
    // MARK: - TableView Setting
    
    private func register() {
        rootView.tableView.register(
            BoxOfficeViewCell.self,
            forCellReuseIdentifier: BoxOfficeViewCell.identifier
        )
    }
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    // MARK: - Action
    
    private func setTarget() {
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func backButtonDidTap(){
        navigationController?.popViewController(animated: false)
    }
}

private extension SearchViewController {
    func requestDailyBoxOfficeList() {
        var date = ""
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        if let yesterday {
            date = format.string(from: yesterday)
        }
        
        BoxOfficeService.shared.dailyBoxOfficeList(date: date) {
            [weak self] response in switch response {
            case .success(let data):
                guard let data = data as? BoxOfficeResponseModel else {
                    return }
            self?.dailyBoxOfficeModelList = data.boxOfficeResult.dailyBoxOfficeList
            self?.rootView.tableView.reloadData()
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

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyBoxOfficeModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BoxOfficeViewCell.identifier, for: indexPath
        ) as? BoxOfficeViewCell else { return UITableViewCell() }
        cell.dataBind(dailyBoxOfficeModelList[indexPath.row])
        return cell
    }
}
