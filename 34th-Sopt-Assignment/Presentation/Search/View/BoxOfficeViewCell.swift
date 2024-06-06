//
//  BoxOfficeViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/10/24.
//

import UIKit
import SnapKit
import Then

final class BoxOfficeViewCell: UITableViewCell {
    
    // MARK: - UI Component
    
    static let identifier = "BoxOfficeViewCell"
    
    private let rankLabel = UILabel()
    
    private let nameLabel = UILabel()
    
    private let audienceLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        
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

private extension BoxOfficeViewCell {
    func setUI() {
        rankLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        }
        
        nameLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        }
        
        audienceLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Medium", size: 12)
        }
    }
    
    func setViewHierarchy() {
        addSubviews(rankLabel, nameLabel, audienceLabel)
    }
    
    func setAutoLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40)
            $0.centerY.equalToSuperview()
        }
        
        audienceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: - Data Bind

extension BoxOfficeViewCell {
    func dataBind (_ boxOfficeData: DailyBoxOfficeList) {
        rankLabel.text = boxOfficeData.rank
        nameLabel.text = boxOfficeData.movieNm
        audienceLabel.text = "\(boxOfficeData.audiCnt)명"
    }
}
