//
//  LoginViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = LoginView()
    
    private let viewModel = LoginViewModel()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        setTextFieldDelegate()
        bindViewModel()
    }
    
    // MARK: - Data Binding
    
    private func bindViewModel() {
        viewModel.isValid = { [weak self] isValid in
            if isValid {
                self?.setLoginButton()
            }
        }
//        viewModel.errMessage = { [weak self] err in
//            if let err = err {
//                self?.showToast(err)
//            }
//        }
    }
    
    // MARK: - Action
    
    private func setTarget() {
        rootView.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rootView.pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        rootView.idClearButton.addTarget(self, action: #selector(idClearButtonDidTap), for: .touchUpInside)
        rootView.pwClearButton.addTarget(self, action: #selector(pwClearButtonDidTap), for: .touchUpInside)
        rootView.pwEyeButton.addTarget(self, action: #selector(pwEyeButtonDidTap), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private func setTextFieldDelegate() {
        rootView.idTextField.delegate = self
        rootView.pwTextField.delegate = self
    }
    
    private func setLoginButton() {
        rootView.loginButton.isEnabled = true
        rootView.loginButton.backgroundColor = .tvingRed
        rootView.loginButton.layer.borderWidth = 0
        rootView.loginButton.setTitleColor(.white, for: .normal)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = rootView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        viewModel.checkValid(id: rootView.idTextField.text, password: rootView.pwTextField.text)
    }
    
    @objc
    private func idClearButtonDidTap(_ sender: UIButton) {
        rootView.idTextField.text = ""
    }
    
    @objc
    private func pwClearButtonDidTap(_ sender: UIButton) {
        rootView.pwTextField.text = ""
    }
    
    @objc
    private func pwEyeButtonDidTap(_ sender: UIButton) {
        rootView.pwTextField.isSecureTextEntry.toggle()
        rootView.pwEyeButton.setImage(rootView.pwTextField.isSecureTextEntry ? .hiddenEye : .shownEye, for: .normal)
    }
    
    @objc
    private func loginButtonDidTap(){
        pushToWelcomeVC()
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setLayer(borderWidth: 1, borderColor: .gray2, cornerRadius: 3)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
