//
//  SearchTableViewCell.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit
import SnapKit

class SearchTableViewCell: BaseTableViewCell {
    
    let appIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [appIcon].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        appIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(20)
            $0.size.equalTo(60)
        }
    }
    
    //    override func configureView() {
    //        <#code#>
    //    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
