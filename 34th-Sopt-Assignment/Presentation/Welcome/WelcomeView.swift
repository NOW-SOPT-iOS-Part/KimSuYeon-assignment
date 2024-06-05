//
//  WelcomeView.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeView: UIView {
    
    // MARK: - UI Component

    private let welcomeImage = UIImageView()
    
    let welcomeLabel = UILabel()
    
    let mainButton = UIButton()
    
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

private extension WelcomeView {
    func setUI() {
        self.do {
            $0.backgroundColor = .black
        }
        
        welcomeImage.do {
            $0.image = .tving
        }
        
        welcomeLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        mainButton.do {
            $0.setTitle("메인으로", titleColor: .white)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.backgroundColor = .tvingRed
            $0.layer.cornerRadius = 3
        }
    }
    
    func setViewHierarchy() {
        addSubviews(welcomeImage, welcomeLabel, mainButton)
    }
    
    func setAutoLayout() {
        welcomeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.leading.trailing.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(336)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
