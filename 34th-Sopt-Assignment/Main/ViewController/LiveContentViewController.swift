//
//  LiveContentViewController.swift
//  34th-Sopt-Assignment
//
//  Created by 예삐 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class LiveContentViewController: UIViewController {
    
    final let cellWidth: CGFloat = 160
    final let cellHeight: CGFloat = 144
    final let contentInterSpacing: CGFloat = 8
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        //layout.isScrollEnabled = true
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private var contentData = LiveContentModel.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private func calculateTotalWidth() -> CGFloat {
        let count = CGFloat(contentData.count)
        return cellWidth * count + contentInterSpacing * (count-1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setLayout()
        register()
        setDelegate()
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(cellHeight)
            $0.width.equalTo(calculateTotalWidth())
        }
    }
    
    private func register() {
        collectionView.register(LiveContentViewCell.self, forCellWithReuseIdentifier: LiveContentViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension LiveContentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return contentInterSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return contentInset
    }
}

extension LiveContentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveContentViewCell.identifier, for: indexPath) as? LiveContentViewCell else { return UICollectionViewCell() }
        cell.dataBind(contentData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

#Preview {
    LiveContentViewController()
}
