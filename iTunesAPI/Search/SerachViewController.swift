//
//  SerachViewController.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit

final class SerachViewController: BaseViewController {
    
        private let searchBar = {
            let view = UISearchBar()
            view.placeholder = "게임, 앱, 스토리 등"
            view.showsCancelButton = true
            return view
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        <#code#>
    }
    
    override func configureConstraints() {
        <#code#>
    }
    
    override func configureView() {
        <#code#>
    }
    
    override func bind() {
        <#code#>
    }
}
