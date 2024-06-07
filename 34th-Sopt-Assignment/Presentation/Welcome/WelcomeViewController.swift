//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    var id: String?
    
    private let rootView = WelcomeView()
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindID()
        setTarget()
    }
    
    // MARK: - Functions
    
    func bindID() {
        guard let idText = id else { return }
        rootView.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    func setTarget() {
        rootView.mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }
    
    func pushToMainVC() {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    @objc
    private func mainButtonDidTap(){
        pushToMainVC()
    }
}
