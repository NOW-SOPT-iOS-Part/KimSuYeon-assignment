//
//  SecondContentViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class SecondContentViewCell: UICollectionViewCell {
    
    static let identifier = "SecondContentViewCell"
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [contentImageView, contentNameLabel].forEach {
            contentView.addSubview($0)
        }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        
        contentNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
    }
}

extension SecondContentViewCell {
    func dataBind(_ contentData: SecondContentModel, itemRow: Int) {
        contentImageView.image = contentData.contentImage
        contentNameLabel.text = contentData.contentNameLabel
        self.itemRow = itemRow //해당 cell의 index
    }
}

