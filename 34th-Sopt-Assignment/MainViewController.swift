//
//  MainViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/25/24.
//

import UIKit
import SnapKit
import Then

final class MainViewController : UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let firstContentViewController = FirstContentViewController()
    
    private let mainPoster = UIImageView().then {
        $0.image = UIImage(named: "poster")
    }
    
    private let gradiant = UIImageView().then {
        $0.image = UIImage(named: "gradiant")
    }
    
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "profile")
    }

    private let titleLabel = UILabel().then {
        $0.text = "수연이가 좋아하는 영화들... 중 몇 개"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    //스크롤뷰 확인용
    private let dummyView = UIView().then {
        $0.backgroundColor = .black
    }
    
    //네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setHierarchy()
        setLayout()
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //SafeArea 무시하기
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    private func setLayout() {
        [mainPoster, gradiant, logo, profileImage, titleLabel, dummyView, firstContentViewController.view].forEach {
            contentView.addSubview($0)
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        mainPoster.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(mainPoster.snp.width).multipliedBy(mainPoster.image!.size.height / mainPoster.image!.size.width) //비율에 맞게
        }
        gradiant.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(240)
        }
        logo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.leading.equalToSuperview().inset(20)
        }
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.trailing.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(44)
            $0.leading.equalToSuperview().inset(20)
        }
        firstContentViewController.view.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(2000)
        }
        dummyView.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(280)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
            $0.bottom.equalTo(contentView) //bottom 설정 까먹지 말기
        }
    }
}
