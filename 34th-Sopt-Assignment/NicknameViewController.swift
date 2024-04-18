//
//  NickNameViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/19/24.
//

import Foundation
import UIKit

import SnapKit

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
        bottomSheetView.addSubview(saveButton)
    }
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.alpha = 0.7
        view.layer.backgroundColor = UIColor.black.cgColor
        
        let dimmedGesture = UITapGestureRecognizer(target: self, action: #selector(dimmedDidTap))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(dimmedGesture)
        return view
    }()
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.cornerRadius = 3
        textField.layer.masksToBounds = true
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(resource: .gray4)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: attributes)
        textField.textColor = UIColor(resource: .gray4)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.backgroundColor = UIColor(resource: .gray2)
        textField.keyboardType = .asciiCapable
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.addPadding(left: 20, right:20)
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(resource: .gray4)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nicknameText = nicknameTextField.text ?? ""
        
        if !nicknameText.isEmpty {
            saveButton.isEnabled = true
            saveButton.backgroundColor = UIColor.red1
        } else {
            saveButton.isEnabled = false
            saveButton.backgroundColor = UIColor(resource: .gray4)
        }
        return true
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
            $0.leading.equalToSuperview().offset(20)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(93)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
}
