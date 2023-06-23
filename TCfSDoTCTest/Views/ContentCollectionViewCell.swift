//
//  ContentCollectionViewCell.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 22.06.2023.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    let someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    //MARK: - setupView
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(someLabel)
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            someLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            someLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            someLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
