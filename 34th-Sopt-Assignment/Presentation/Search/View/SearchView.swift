//
//  SearchView.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/7/24.
//

import UIKit
import SnapKit
import Then

final class SearchView: UIView {
    
    // MARK: - UIComponent
    
    private let searchTextField = UITextField()
    
    private let rankingLabel = UILabel()
    
    let backButton = UIButton()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setting

private extension SearchView {
    func setUI() {
        self.do {
            $0.backgroundColor = .black
        }
        
        backButton.do {
            $0.setImage(.backIcon, for: .normal)
        }
        
        searchTextField.do {
            $0.setText(placeholder: "찾고 싶은 영화를 검색하세요.", 
                       textColor: .white, backgroundColor: .gray4, placeholderColor: .gray2)
            $0.font = UIFont(name: "Pretendard-Medium", size: 14)
            $0.layer.cornerRadius = 3
            $0.addPadding(left: 20, right:20)
        }
        
        rankingLabel.do {
            $0.setText("일일 박스오피스 순위", color: .white)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        }
        
        tableView.do {
            $0.backgroundColor = .black
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    func setViewHierarchy() {
        addSubviews(backButton, searchTextField, rankingLabel, tableView)
    }
    
    func setAutoLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalTo(searchTextField)
            $0.size.equalTo(24)
        }
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().inset(48)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(rankingLabel.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
