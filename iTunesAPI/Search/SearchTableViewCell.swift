//
//  SearchTableViewCell.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit

final class SearchTableViewCell: BaseTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
