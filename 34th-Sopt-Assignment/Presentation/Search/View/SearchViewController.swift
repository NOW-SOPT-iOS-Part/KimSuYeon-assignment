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
    
    private let viewModel = SearchViewModel()
    
    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
        
        viewModel.requestDailyBoxOfficeList()
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        setDelegate()
        setTarget()
        bindViewModel()
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
    
    // MARK: - Data Binding
    
    private func bindViewModel() {
        viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.rootView.tableView.reloadData()
            }
        }
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

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dailyBoxOfficeModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BoxOfficeViewCell.identifier, for: indexPath
        ) as? BoxOfficeViewCell else { return UITableViewCell() }
        cell.dataBind(viewModel.dailyBoxOfficeModelList[indexPath.row])
        return cell
    }
}
