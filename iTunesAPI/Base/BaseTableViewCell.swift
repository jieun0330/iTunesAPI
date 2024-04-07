//
//  BaseTableViewCell.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
        configureView()
        
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureView() { }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
