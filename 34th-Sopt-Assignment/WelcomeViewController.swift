//
//  WelcomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/18/24.
//

import Foundation
import UIKit

import SnapKit

/*
protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}
*/

final class WelcomeViewController: UIViewController {
    
    //weak var delegate: DataBindProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        setLayout()
        
        bindID()
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "tiving")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        //label.text = "???님\n반가워요!"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
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
    
    var id: String?

    private func bindID() { //guard let 방식의 옵셔널 바인딩
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
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
}
