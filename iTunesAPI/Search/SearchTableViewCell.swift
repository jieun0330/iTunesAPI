//
//  SearchTableViewCell.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchTableViewCell: BaseTableViewCell {
    
    let disposeBag = DisposeBag()
    
    let appIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    let appName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let ratingsStar: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        image.image = UIImage(systemName: "star.fill")
        return image
    }()
    
    let ratingsNum: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    let company: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    let theme: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: collectionViewLayout())
        collectionView.register(ScreenShotsCollectionViewCell.self, forCellWithReuseIdentifier: ScreenShotsCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [appIcon, appName, downloadButton, ratingsStar, ratingsNum, company, theme, collectionView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        appIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(60)
        }
        
        appName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalTo(appIcon.snp.trailing).offset(12)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
        
        ratingsStar.snp.makeConstraints {
            $0.top.equalTo(appIcon.snp.bottom).offset(8)
            $0.leading.equalTo(appIcon.snp.leading)
            $0.size.equalTo(20)
        }
        
        ratingsNum.snp.makeConstraints {
            $0.top.equalTo(appIcon.snp.bottom).offset(12)
            $0.leading.equalTo(appIcon.snp.trailing).inset(28)
        }
        
        company.snp.makeConstraints {
            $0.top.equalTo(appIcon.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        theme.snp.makeConstraints {
            $0.top.equalTo(appIcon.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(ratingsStar.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(220)
        }
    }
    
    //    override func configureView() {
    //        <#code#>
    //    }
    
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 2)
        layout.itemSize = CGSize(width: width / 3.35, height: width / 1.85)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
