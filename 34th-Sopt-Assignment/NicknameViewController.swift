//
//  NickNameViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/19/24.
//

import UIKit
import SnapKit
import Then

final class NicknameViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setHierarchy()
        setLayout()
    }
    
    private func setHierarchy() {
        self.view.addSubview(dimmedView)
        self.view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(titleLabel)
        bottomSheetView.addSubview(nicknameTextField)
        bottomSheetView.addSubview(koreanOnlyLabel)
        bottomSheetView.addSubview(saveButton)
    }
    
    private lazy var dimmedView = UIView().then {
        $0.alpha = 0.7
        $0.layer.backgroundColor = UIColor.black.cgColor
        
        let dimmedGesture = UITapGestureRecognizer(target: self, action: #selector(dimmedDidTap))
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(dimmedGesture)
    }
    
    private let bottomSheetView = UIView().then {
        $0.backgroundColor = UIColor.white
        $0.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 만들어주세요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Medium", size: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 20, right:20)
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(resource: .gray1)
        
        $0.setPlaceholder(placeholder: "한글로 입력", fontColor: UIColor(resource: .gray2))
        $0.textColor = UIColor(resource: .gray4)
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    private lazy var koreanOnlyLabel = UILabel().then {
        $0.text = "올바른 닉네임을 입력해주세요."
        $0.textColor = .red1
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.isHidden = true
    }
    
    private lazy var saveButton = UIButton().then {
        $0.backgroundColor = UIColor(resource: .gray2)
        $0.layer.cornerRadius = 3
        $0.layer.masksToBounds = true
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //$0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    

    func setSaveButton(nickname: String, isEnabled: Bool) {
        if isEnabled {
            let isValid = nickname.range(of: "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$", options: .regularExpression) != nil
            saveButton.backgroundColor = isValid ? UIColor(resource: .red1) : UIColor(resource: .gray2)
            koreanOnlyLabel.isHidden = isValid ? true : false
        } else {
            saveButton.backgroundColor = UIColor(resource: .gray2)
            koreanOnlyLabel.isHidden = true
        }
    }
    
    @objc
    func textFieldChange() {
        let nickname = nicknameTextField.text ?? ""
        setSaveButton(nickname: nickname, isEnabled: !nickname.isEmpty)

    }
    
    @objc
    func dimmedDidTap(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
    private func setLayout() {
        dimmedView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomSheetView.snp.top)
        }
        bottomSheetView.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.size.height / 2)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(93)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        koreanOnlyLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
