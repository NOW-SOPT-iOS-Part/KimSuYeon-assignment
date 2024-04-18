//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation

import UIKit

import SnapKit

final class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        setLayout()
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "tiving")
        return imageView
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(resource: .red1)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //button.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private func setLayout() {
        [logoImageView, mainButton].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.leading.trailing.equalToSuperview().offset(0)
        }
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
}
