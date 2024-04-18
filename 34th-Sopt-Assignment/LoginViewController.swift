//
//  LoginViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation
import UIKit

import SnapKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        setLayout()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TIVING ID 로그인"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 335, height: 52))
        textField.layer.cornerRadius = 3
        textField.layer.masksToBounds = true
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(resource: .gray2)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: attributes)
        textField.layer.borderColor = UIColor(resource: .gray4).cgColor
        textField.textColor = UIColor(resource: .gray2)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor(resource: .gray4)
        textField.keyboardType = .asciiCapable
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.addPadding(left: 20, right:20)
        return textField
    }()
    
    private lazy var pwTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 335, height: 52))
        textField.layer.cornerRadius = 3
        textField.layer.masksToBounds = true
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(resource: .gray2)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attributes)
        textField.textColor = UIColor(resource: .gray2)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor(resource: .gray4)
        textField.keyboardType = .asciiCapable
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.addPadding(left: 20, right: 20)
        textField.isSecureTextEntry = true
        
        let pwButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 76, height: 20))
        pwButtonView.addSubview(pwClearButton)
        pwButtonView.addSubview(pwEyeButton)
        textField.rightView = pwButtonView
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private lazy var pwClearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "x-circle"), for: .normal)
        button.frame = CGRect(x: 0, y:0, width: 20, height: 20)
        button.addTarget(self, action: #selector(pwClearButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var pwEyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "hidden-eye"), for: .normal)
        button.frame = CGRect(x: 36, y:0, width: 20, height: 20)
        button.addTarget(self, action: #selector(pwEyeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 332, height: 58))
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(resource: .gray4).cgColor
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(resource: .gray2), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let idFindLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.textColor = UIColor(resource: .gray2)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let pwFindLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.textColor = UIColor(resource: .gray2)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    let lineWidth: CGFloat = 1
    let lineHeight: CGFloat = 12
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(resource: .gray4)
        return line
    }()
    
    private let profileMakeLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = UIColor(resource: .gray3)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let nicknameMakeLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임 만들러가기"
        label.underLineText(forText: label.text ?? "")
        label.textColor = UIColor(resource: .gray2)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        return label
    }()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(resource: .gray2).cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let idText = idTextField.text ?? ""
        let pwText = pwTextField.text ?? ""
        
        if !idText.isEmpty && !pwText.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.red1
            loginButton.layer.borderWidth = 0
            loginButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.black
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor(resource: .gray4).cgColor
            loginButton.setTitleColor(UIColor(resource: .gray2), for: .normal)
        }
        return true
    }

    @objc
    func pwEyeButtonDidTap(_ sender: UIButton) {
        pwTextField.isSecureTextEntry.toggle()
        if pwTextField.isSecureTextEntry {
            pwEyeButton.setImage(UIImage(named: "hidden-eye"), for: .normal)
        } else {
            pwEyeButton.setImage(UIImage(named: "shown-eye"), for: .normal)
        }
    }
    
    @objc
    func pwClearButtonDidTap(_ sender: UIButton) {
        pwTextField.text = ""
    }
    
    private func setLayout() {
        [titleLabel, idTextField, pwTextField, loginButton, idFindLabel, pwFindLabel, lineView, profileMakeLabel, nicknameMakeLabel].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(158)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        idFindLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(85)
        }
        pwFindLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().offset(-85)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(lineHeight)
            $0.width.equalTo(lineWidth)
        }
        profileMakeLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(81)
            $0.leading.equalToSuperview().offset(51)
        }
        nicknameMakeLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(81)
            $0.trailing.equalToSuperview().offset(-62)
        }
    }
}