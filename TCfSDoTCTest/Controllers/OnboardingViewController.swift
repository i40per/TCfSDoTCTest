//
//  OnboardingViewController.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 20.06.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "The Center for Sustainable Development of the capital."
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setTarget()
        setConstraints()
    }
    
    //MARK: - setupViews
    private func setupViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(nextButton)
        
        view.backgroundColor = .systemBackground
    }
    
    @objc private func didTapCreateAccount() {
        let vc = MainViewController()
        vc.modalPresentationStyle = .automatic
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - setTarget
    private func setTarget() {
        nextButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        let welcomeLabelConstraints = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let nextButtonConstraints = [
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            nextButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(welcomeLabelConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
}
