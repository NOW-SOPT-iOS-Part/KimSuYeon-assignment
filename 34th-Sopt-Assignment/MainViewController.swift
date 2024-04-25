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
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .black
        setHierarchy()
        setLayout()
    }
    
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
    
    private let label1 = UILabel().then {
        $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private let dummyView = UIView().then { //스크롤뷰 확인용
        $0.backgroundColor = .white
    }
    
    //네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
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
        [mainPoster, gradiant, logo, profileImage, label1, dummyView].forEach {
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
        label1.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(44)
            $0.leading.equalToSuperview().inset(20)
        }
        dummyView.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(200)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
            $0.bottom.equalTo(contentView) //bottom 설정 까먹지 말기
        }
    }
}
