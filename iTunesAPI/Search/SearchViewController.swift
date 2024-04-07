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
import Kingfisher

final class SearchViewController: BaseViewController {
    
    private let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
    
    private let searchBar = {
        let search = UISearchBar()
        search.placeholder = "게임, 앱, 스토리 등"
        search.showsCancelButton = true
        return search
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.rowHeight = 320
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
        let input = SearchViewModel.Input(searchButtonTap: searchBar.rx.searchButtonClicked,
                                          searchText: searchBar.rx.text.orEmpty)
        
        let output = viewModel.transform(input: input)
        
        output.itunesInfo
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier,
                                         cellType: SearchTableViewCell.self)) { row, element, cell in
                cell.appIcon.kf.setImage(with: URL(string: element.artworkUrl100))
                cell.appName.text = element.trackName
                cell.ratingsNum.text = String(element.averageUserRating)
                cell.company.text = element.artistName
                cell.theme.text = element.genres.first
            }
                                         .disposed(by: disposeBag)
    }
}
