//
//  LiveContentViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class LiveContentViewCell: UICollectionViewCell {
    
    static let identifier = "LiveContentViewCell"
    
    var itemRow: Int?
    
    private let contentImageView = UIImageView()
    
    private let broadcastLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.numberOfLines = 1
    }
    
    private let contentNameLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.numberOfLines = 1
    }
    
    private let ratingLabel = UILabel().then {
        $0.textColor = UIColor(resource: .gray2)
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(
            contentImageView,
            broadcastLabel,
            contentNameLabel,
            ratingLabel
        )
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        broadcastLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        contentNameLabel.snp.makeConstraints {
            $0.top.equalTo(broadcastLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(contentNameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
    }
}

extension LiveContentViewCell {
    func dataBind(_ contentData: LiveContentModel, itemRow: Int) {
        contentImageView.image = contentData.contentImage
        broadcastLabel.text = contentData.broadcastLabel
        contentNameLabel.text = contentData.contentNameLabel
        ratingLabel.text = contentData.ratingLabel
        self.itemRow = itemRow //해당 cell의 index
    }
}
