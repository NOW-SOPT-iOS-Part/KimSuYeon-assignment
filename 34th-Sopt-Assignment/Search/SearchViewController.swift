//
//  SearchViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 5/9/24.
//

import UIKit

import SnapKit
import Then

final class SearchViewController: UIViewController {
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "back-icon"), for: .normal)
        $0.frame = CGRect(x: 0, y:0, width: 20, height: 20)
        $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    private let searchTextField = UITextField().then {
        $0.layer.cornerRadius = 3
        $0.addPadding(left: 20, right:20)
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(resource: .gray4)
        
        $0.setPlaceholder(placeholder: "찾고 싶은 영화를 검색하세요.", fontColor: UIColor(resource: .gray2))
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .white
    }
    
    private let lankingLabel = UILabel().then {
        $0.text = "일일 박스오피스 순위"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    @objc
    private func backButtonDidTap(){
        navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubviews(backButton, searchTextField, lankingLabel)
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalTo(searchTextField)
            $0.width.height.equalTo(24)
        }
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().inset(48)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        lankingLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
