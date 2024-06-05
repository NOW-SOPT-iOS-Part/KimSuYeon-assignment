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
    
    // MARK: - LifeCycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
    }
}

private extension LoginViewController {
    func setTarget() {

    }
}
