//
//  MainViewController.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 20.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var headerView = HeaderView()
    private let collectionVC = CollectionViewController()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavbar()
        setConstraints()
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }
    
    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideNavigationBar()
    }
    
    //MARK: - setupViews
    private func setupViews() {
        view.addSubview(headerView)
        view.addSubview(collectionVC)
        
        view.backgroundColor = .systemBackground
    }
    
    //MARK: - setupNavbar
    private func setupNavbar() {
        title = "Индивидуальный учебный план"
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.948412478, green: 0.4427403808, blue: 0.4211769104, alpha: 1)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "arrow.down.doc"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let collectionVCConstraints = [
            collectionVC.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            collectionVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionVC.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(collectionVCConstraints)
    }
}
