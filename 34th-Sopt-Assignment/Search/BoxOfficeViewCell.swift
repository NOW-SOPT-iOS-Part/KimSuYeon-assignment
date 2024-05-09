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
    
    static let identifier = "BoxOfficeViewCell"

    private let rankLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }
    
    private let movieNameLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }
    
    private let audienceLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        contentView.backgroundColor = .black
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(rankLabel, movieNameLabel, audienceLabel)
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
        }
        movieNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40)
            $0.centerY.equalTo(rankLabel)
        }
        audienceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(rankLabel)
        }
    }
}

extension BoxOfficeViewCell {
    func dataBind (_ boxOfficeData: DailyBoxOfficeList) {
        rankLabel.text = boxOfficeData.rank
        movieNameLabel.text = boxOfficeData.movieNm
        audienceLabel.text = "\(boxOfficeData.audiCnt)명"
    }
}
