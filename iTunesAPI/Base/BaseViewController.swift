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
        bind()
    }
    
    func configureHierarchy() { }
    func configureConstraints() { }
    func configureView() {
        view.backgroundColor = .white
    }
    func bind() { }
}
