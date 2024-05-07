//
//  MainViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/25/24.
//

import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let tivingContentViewController = TivingContentViewController()
    private let liveContentViewController = LiveContentViewController()
    private let recommendContentViewController = RecommendContentViewController()
    
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

    private let tivingLabel = UILabel().then {
        $0.text = "티빙에서 꼭 봐야하는 컨텐츠"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private let liveLabel = UILabel().then {
        $0.text = "인기 LIVE 채널"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private let recommendLabel = UILabel().then {
        $0.text = "mmaybei 님이 추천하는 영화"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private let adImageView = UIImageView().then {
        $0.image = UIImage(named: "doosan")
    }
    
    //스크롤뷰 확인용
    private let footerView = UIView().then {
        $0.backgroundColor = .black
    }
    
    //네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
        contentView.addSubviews(
            mainPoster,
            gradiant,
            logo,
            profileImage,
            tivingLabel,
            footerView,
            tivingContentViewController.view,
            liveLabel,
            liveContentViewController.view,
            recommendLabel,
            recommendContentViewController.view,
            adImageView
        )
        
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
            if let image = mainPoster.image {
                $0.height.equalTo(mainPoster.snp.width).multipliedBy(image.size.height / image.size.width)
            } //비율에 맞게
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
        tivingLabel.snp.makeConstraints {
            $0.top.equalTo(mainPoster.snp.bottom).offset(44)
            $0.leading.equalToSuperview().inset(20)
        }
        tivingContentViewController.view.snp.makeConstraints {
            $0.top.equalTo(tivingLabel.snp.bottom).offset(14)
            $0.bottom.equalTo(tivingLabel.snp.bottom).offset(200)
            $0.leading.trailing.equalToSuperview()
        }
        liveLabel.snp.makeConstraints {
            $0.top.equalTo(tivingContentViewController.view.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        liveContentViewController.view.snp.makeConstraints {
            $0.top.equalTo(liveLabel.snp.bottom).offset(14)
            $0.bottom.equalTo(liveLabel.snp.bottom).offset(180)
            $0.leading.trailing.equalToSuperview()
        }
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(liveContentViewController.view.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        recommendContentViewController.view.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(14)
            $0.bottom.equalTo(recommendLabel.snp.bottom).offset(200)
            $0.leading.trailing.equalToSuperview()
        }
        adImageView.snp.makeConstraints {
            $0.top.equalTo(recommendContentViewController.view.snp.bottom).offset(40)
            if let image = adImageView.image {
                $0.height.equalTo(adImageView.snp.width).multipliedBy(image.size.height / image.size.width)
            } //비율에 맞게
        }
        footerView.snp.makeConstraints {
            $0.top.equalTo(adImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
            $0.bottom.equalTo(contentView) //bottom 설정 까먹지 말기
        }
    }
}
