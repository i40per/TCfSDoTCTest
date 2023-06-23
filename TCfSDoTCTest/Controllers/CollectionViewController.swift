//
//  CollectionViewController.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 22.06.2023.
//

import UIKit

class CollectionViewController: UIView {
    
    let custCollectionViewLayout = CustomCollectionViewLayout()
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: CustomCollectionViewLayout())
    
    private let typeOfLesson = ["","Лекция", "Семинар", "Лаборат.", "Семестр"]
    
    private let disciplins = ["","Электрохимия \n(на англ. яз.)",
                              "Иностранный язык С1",
                              "Основы химического \nанализа"]
    
    private let timeLabel = ["", "5/15", "10/30", "10/45", "7/15"]
    private let timeLabelOne = ["", "2/10", "5/14", "3/45", "2/20"]
    
    private let contentCellID = "ContentCellID"
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupViews
    private func setupViews() {
        addSubview(collectionView)
        
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = false
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: contentCellID)
    }
    
    //MARK: - setDelegates
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 600),
            collectionView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath) as! ContentCollectionViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.someLabel.text = "Наименование \nдисциплины"
                cell.someLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
            } else {
                cell.someLabel.text = typeOfLesson[indexPath.row]
                cell.someLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
            }
        } else {
            if indexPath.row == 0 {
                cell.someLabel.text = disciplins[indexPath.section]
                cell.someLabel.font = UIFont.boldSystemFont(ofSize: 12)
                
            } else if indexPath.section == 1 {
                cell.someLabel.text = timeLabel[indexPath.item]
                cell.someLabel.textColor = .red
            } else if indexPath.section == 2 {
                cell.someLabel.text = timeLabelOne[indexPath.item]
                cell.someLabel.textColor = .red
            } else {
                cell.someLabel.text = timeLabel[indexPath.item]
                cell.someLabel.textColor = .red
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeOfLesson.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return disciplins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
