//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        setLayout()
        
        bindID()
    }
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "tiving")
    }
    
    private let welcomeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private lazy var mainButton = UIButton().then {
        $0.backgroundColor = UIColor(resource: .red1)
        $0.layer.cornerRadius = 3
        $0.layer.masksToBounds = true
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }
    
    var id: String?

    private func bindID() { //guard let 방식의 옵셔널 바인딩
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    private func pushToMainVC() { //네비게이션 방식
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    private func setLayout() {
        self.view.addSubviews(logoImageView, welcomeLabel, mainButton)
        
        logoImageView.snp.makeConstraints {
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
    
    @objc
    private func mainButtonDidTap(){
        pushToMainVC()
    }
}
