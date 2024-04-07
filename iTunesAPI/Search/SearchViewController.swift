//
//  SerachViewController.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {
    
    private let searchBar = {
        let search = UISearchBar()
        search.placeholder = "게임, 앱, 스토리 등"
        search.showsCancelButton = true
        return search
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.backgroundColor = .orange
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
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        navigationItem.titleView = searchBar
    }
    
    override func bind() {
        
    }
}
