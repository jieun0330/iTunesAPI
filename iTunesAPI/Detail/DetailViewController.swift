//
//  DetailViewController.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailViewController: BaseViewController {
    
    var item: InfoItunes?
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let appIcon: UIImageView = {
        let icon = UIImageView()
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 8
        return icon
    }()
    
    private let iconName = UILabel()
    
    private let company: UILabel = {
        let company = UILabel()
        company.font = .systemFont(ofSize: 12)
        company.textColor = .lightGray
        return company
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let newLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHierarchy() {
        [scrollView].forEach {
            view.addSubview($0)
        }
        
        [contentView].forEach {
            scrollView.addSubview($0)
        }
        
        [appIcon, iconName, company, downloadButton, newLabel, versionLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        appIcon.snp.makeConstraints {
            $0.size.equalTo(92)
            $0.top.leading.equalToSuperview().offset(12)
        }
        
        iconName.snp.makeConstraints {
            $0.leading.equalTo(appIcon.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(appIcon).offset(8)
        }
        
        company.snp.makeConstraints {
            $0.leading.equalTo(iconName)
            $0.top.equalTo(iconName.snp.bottom).offset(8)
        }
        
        downloadButton.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(28)
            $0.leading.equalTo(iconName)
            $0.bottom.equalTo(appIcon)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(appIcon.snp.bottom).offset(16)
            $0.leading.equalTo(appIcon)
        }
        
        versionLabel.snp.makeConstraints {
            $0.leading.equalTo(newLabel)
            $0.top.equalTo(newLabel.snp.bottom).offset(8)
        }
    }
    
    override func configureView() {
        guard let item else { return }
        appIcon.kf.setImage(with: URL(string: item.artworkUrl100))
        iconName.text = item.trackName
        company.text = item.artistName
//        versionLabel.text = "버전 \(item.)"
    }
    
    //    override func bind() {
    //        <#code#>
    //    }
}
