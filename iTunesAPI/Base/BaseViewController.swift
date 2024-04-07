//
//  BaseViewController.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureConstraints()
        configureView()
        view.backgroundColor = .white
        bind()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureView() { }
    func bind() { }
}
