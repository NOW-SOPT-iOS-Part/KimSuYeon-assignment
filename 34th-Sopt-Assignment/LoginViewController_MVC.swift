//
//  LoginViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import UIKit
import SnapKit
import Then

final class LoginViewController_MVC: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        setLayout()
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "TIVING ID 로그인"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
    }
    
    private lazy var idTextField = UITextField().then {
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 20, right:20)
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(resource: .gray4)
        
        //$0.setPlaceholder(placeholder: "아이디", fontColor: UIColor(resource: .gray2))
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.textColor = UIColor(resource: .gray2)
        
        $0.keyboardType = .asciiCapable
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        let idButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        idButtonView.addSubview(idClearButton)
        $0.rightView = idButtonView
        $0.rightViewMode = .always
    }
    
    private lazy var pwTextField = UITextField().then {
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 20, right: 20)
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(resource: .gray4)
        
        //$0.setPlaceholder(placeholder: "비밀번호", fontColor: UIColor(resource: .gray2))
        $0.textColor = UIColor(resource: .gray2)
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    
        $0.isSecureTextEntry = true
        $0.keyboardType = .asciiCapable
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        let pwButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 76, height: 20))
        pwButtonView.addSubview(pwClearButton)
        pwButtonView.addSubview(pwEyeButton)
        $0.rightView = pwButtonView
        $0.rightViewMode = .always
    }
    
    private lazy var idClearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.frame = CGRect(x: 0, y:0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(idClearButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var pwClearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.frame = CGRect(x: 0, y:0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(pwClearButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var pwEyeButton = UIButton().then {
        $0.setImage(UIImage(named: "hidden-eye"), for: .normal)
        $0.frame = CGRect(x: 36, y:0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(pwEyeButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = UIColor.black
        $0.layer.cornerRadius = 3
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(resource: .gray4).cgColor
        
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor(resource: .gray2), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private let idFindLabel = UILabel().then {
        $0.text = "아이디 찾기"
        $0.textColor = UIColor(resource: .gray2)
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let pwFindLabel = UILabel().then {
        $0.text = "비밀번호 찾기"
        $0.textColor = UIColor(resource: .gray2)
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = UIColor(resource: .gray4)
    }
    
    private let profileMakeLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = UIColor(resource: .gray3)
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private lazy var nicknameMakeLabel = UILabel().then {
        $0.text = "닉네임 만들러가기"
        //$0.underLineText(forText: $0.text ?? "")
        $0.textColor = UIColor(resource: .gray2)
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        let nicknameGesture = UITapGestureRecognizer(target: self, action: #selector(nicknameDidTap))
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(nicknameGesture)
    }
    
    private func pushToWelcomeVC() { //네비게이션 방식
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = self.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func presentToNicknameVC() { //모달 방식
        let nicknameViewController = NicknameViewController()
        nicknameViewController.modalPresentationStyle = .formSheet
        self.present(nicknameViewController, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(resource: .gray2).cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    func setLoginButton(isEnabled: Bool) {
        if isEnabled {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .tvingRed
            loginButton.layer.borderWidth = 0
            loginButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.black
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor(resource: .gray4).cgColor
            loginButton.setTitleColor(UIColor(resource: .gray2), for: .normal)
        }
    }
    
    @objc
    func textFieldChange() {
        let id = self.idTextField.text ?? ""
        let pw = self.pwTextField.text ?? ""
        setLoginButton(isEnabled: !id.isEmpty && !pw.isEmpty)
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
    func idClearButtonDidTap(_ sender: UIButton) {
        idTextField.text = ""
    }
    
    @objc
    func pwClearButtonDidTap(_ sender: UIButton) {
        pwTextField.text = ""
    }
    
    @objc
    private func loginButtonDidTap(){
        pushToWelcomeVC()
    }
    
    @objc
    private func nicknameDidTap(){
        presentToNicknameVC()
    }
    
    private func setLayout() {
        self.view.addSubviews(titleLabel, idTextField, pwTextField, loginButton, idFindLabel, pwFindLabel, lineView, profileMakeLabel, nicknameMakeLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(158)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
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
            $0.height.equalTo(1)
            $0.width.equalTo(12)
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
