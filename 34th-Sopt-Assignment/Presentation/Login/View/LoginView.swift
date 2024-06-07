//
//  LoginView.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - UI Component
    
    private let titleLabel = UILabel()
    
    private let idView = UIView()
    
    private let pwView = UIView()
    
    let idTextField = UITextField()
    
    let pwTextField = UITextField()
    
    let idClearButton = UIButton()
    
    let pwClearButton = UIButton()
    
    let pwEyeButton = UIButton()
    
    let loginButton = UIButton()
    
    private let idFindLabel = UILabel()
    
    private let pwFindLabel = UILabel()
    
    private let lineView = UIView()
    
    private lazy var profileMakeLabel = UILabel()
    
    private lazy var nicknameMakeLabel = UILabel()
    
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

private extension LoginView {
    func setUI() {
        self.do {
            $0.backgroundColor = .black
        }
        
        titleLabel.do {
            $0.setText("TVING ID 로그인", color: .white)
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        
        idTextField.do {
            $0.setText(
                placeholder: "아이디",
                textColor: .gray2,
                backgroundColor: .gray4,
                placeholderColor: .gray2
            )
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.layer.cornerRadius = 3
            $0.addPadding(left: 20, right:20)
            
            $0.keyboardType = .asciiCapable
            $0.autocapitalizationType = .none
        }
        
        pwTextField.do {
            $0.setText(
                placeholder: "비밀번호",
                textColor: .gray2,
                backgroundColor: .gray4,
                placeholderColor: .gray2
            )
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.layer.cornerRadius = 3
            $0.addPadding(left: 20, right:20)
            
            $0.keyboardType = .asciiCapable
            $0.autocapitalizationType = .none
            
            $0.isSecureTextEntry = true
        }
        
        idClearButton.do {
            $0.setImage(.xCircle, for: .normal)
        }
        
        pwClearButton.do {
            $0.setImage(.xCircle, for: .normal)
        }
        
        pwEyeButton.do {
            $0.setImage(.hiddenEye, for: .normal)
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", titleColor: .gray2)
            $0.setLayer(borderWidth: 1, borderColor: .gray4, cornerRadius: 3)
            $0.backgroundColor = .black
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            
            $0.isEnabled = false
        }
        
        idFindLabel.do {
            $0.setText("아이디 찾기", color: .gray2)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
        
        pwFindLabel.do {
            $0.setText("비밀번호 찾기", color: .gray2)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
        
        lineView.do {
            $0.backgroundColor = .gray4
        }
        
        profileMakeLabel.do {
            $0.setText("아직 계정이 없으신가요?", color: .gray3)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
        
        nicknameMakeLabel.do {
            $0.setText("닉네임 만들러가기", color: .gray3)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
    }
    
    func setViewHierarchy() {
        addSubviews(
            titleLabel,
            idView,
            pwView,
            loginButton,
            idFindLabel,
            pwFindLabel,
            lineView,
            profileMakeLabel,
            nicknameMakeLabel
        )
        idView.addSubviews(idTextField, idClearButton)
        pwView.addSubviews(pwTextField, pwClearButton, pwEyeButton)
    }
    
    func setAutoLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        
        idView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(158)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        idClearButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        pwView.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pwClearButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        pwEyeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(56)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idFindLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
        }
        
        pwFindLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(85)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        profileMakeLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(81)
            $0.leading.equalToSuperview().inset(51)
        }
        
        nicknameMakeLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(81)
            $0.trailing.equalToSuperview().inset(62)
        }
    }
}
