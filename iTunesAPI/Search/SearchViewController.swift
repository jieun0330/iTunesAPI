//
//  SerachViewController.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    private let searchBar = {
        let search = UISearchBar()
        search.placeholder = "게임, 앱, 스토리 등"
        search.showsCancelButton = true
        return search
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        //        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.backgroundColor = .orange
        tableView.rowHeight = 250
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHierarchy() {
        [searchBar, tableView].forEach {
            view.addSubview($0)
        }
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