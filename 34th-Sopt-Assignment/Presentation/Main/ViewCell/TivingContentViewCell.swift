//
//  TivingContentViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/25/24.
//

import UIKit
import SnapKit
import Then

final class TivingContentViewCell: UICollectionViewCell {
    
    static let identifier = "TivingContentViewCell"
    
    var itemRow: Int?
    
    private let contentImageView = UIImageView()
    
    private let contentNameLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.numberOfLines = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(
            contentImageView,
            contentNameLabel
        )
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        contentNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }
}

extension TivingContentViewCell {
    func dataBind(_ contentData: TivingContentModel, itemRow: Int) {
        contentImageView.image = contentData.contentImage
        contentNameLabel.text = contentData.contentNameLabel
        self.itemRow = itemRow //해당 cell의 index
    }
}
