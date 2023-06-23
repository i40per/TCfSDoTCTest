//
//  HeaderView.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 20.06.2023.
//

import UIKit

class HeaderView: UIView {
    
    private enum SectionTabs: String {
        case fifthSemester = "Семестер 5"
        case sixthSemester = "Семестер 6"
        
        var index: Int {
            switch self {
            case .fifthSemester:
                return 0
            case .sixthSemester:
                return 1
            }
        }
    }
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trailingAnchors: [NSLayoutConstraint] = []
    
    private let indicator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9893463254, green: 0.7961058021, blue: 0.2712723315, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private var selectedTab: Int = 0 {
        didSet {
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
                    self?.sectionStack.arrangedSubviews[i].tintColor = i == self?.selectedTab ? .label : .secondaryLabel
                    self?.leadingAnchors[i].isActive = i == self?.selectedTab ? true : false
                    self?.trailingAnchors[i].isActive = i == self?.selectedTab ? true : false
                    self?.layoutIfNeeded()
                } completion: { _ in
                    
                }
            }
        }
    }
    
    private var tabs: [UIButton] = ["Семестер 5", "Семестер 6"]
        .map { buttonTitle in
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private let academicYearLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Индивидуальный учебный план \nна 2020 - 2021 уч. год."
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let classroomClassesLabel: UILabel = {
        let label = UILabel()
        label.text = "Аудиторные занятия в часах"
        label.font = .systemFont(ofSize: 14, weight: .ultraLight)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let firstLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureStackButton()
        setConstraints()
    }
    
    //MARK: - setupViews
    private func setupViews() {
        addSubview(academicYearLabel)
        addSubview(sectionStack)
        addSubview(indicator)
        addSubview(classroomClassesLabel)
        addSubview(firstLineView)
        addSubview(secondLineView)
        addSubview(thirdLineView)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - configureStackButton
    private func configureStackButton() {
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            
            if i == selectedTab {
                button.tintColor = .label
            } else {
                button.tintColor = .secondaryLabel
            }
            
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else { return }
        switch label {
        case SectionTabs.fifthSemester.rawValue:
            selectedTab = 0
        case SectionTabs.sixthSemester.rawValue:
            selectedTab = 1
        default:
            selectedTab = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
        }
        
        let indicatorConstraints = [
        leadingAnchors[0],
        trailingAnchors[0],
        indicator.topAnchor.constraint(equalTo: sectionStack.arrangedSubviews[0].bottomAnchor),
        indicator.heightAnchor.constraint(equalToConstant: 4)
        ]
        
        let academicYearLabelConstraints = [
            academicYearLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            academicYearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            academicYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        
        let sectionStackConstraints = [
            sectionStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            sectionStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            sectionStack.topAnchor.constraint(equalTo: academicYearLabel.bottomAnchor, constant: 30),
            sectionStack.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        let classroomClassesLabelConstraints = [
            classroomClassesLabel.topAnchor.constraint(equalTo: sectionStack.bottomAnchor, constant: 40),
            classroomClassesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        
        let firstLineViewConstraints = [
            firstLineView.topAnchor.constraint(equalTo: academicYearLabel.topAnchor, constant: 60),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstLineView.widthAnchor.constraint(equalToConstant: 393)
        ]
        
        let secondLineViewConstraints = [
            secondLineView.bottomAnchor.constraint(equalTo: sectionStack.bottomAnchor, constant: 8),
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            secondLineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondLineView.widthAnchor.constraint(equalToConstant: 393)
        ]
        
        let thirdLineViewConstraints = [
            thirdLineView.bottomAnchor.constraint(equalTo: sectionStack.bottomAnchor, constant: 62),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            thirdLineView.widthAnchor.constraint(equalToConstant: 393)
        ]
        
        NSLayoutConstraint.activate(sectionStackConstraints)
        NSLayoutConstraint.activate(indicatorConstraints)
        NSLayoutConstraint.activate(academicYearLabelConstraints)
        NSLayoutConstraint.activate(classroomClassesLabelConstraints)
        NSLayoutConstraint.activate(firstLineViewConstraints)
        NSLayoutConstraint.activate(secondLineViewConstraints)
        NSLayoutConstraint.activate(thirdLineViewConstraints)
    }
}
