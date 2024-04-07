//
//  ScreenShotsCollectionViewCell.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit
import SnapKit

final class ScreenShotsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let screenShots: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    override func configureHierarchy() {
        [screenShots].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureConstraints() {
        screenShots.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
