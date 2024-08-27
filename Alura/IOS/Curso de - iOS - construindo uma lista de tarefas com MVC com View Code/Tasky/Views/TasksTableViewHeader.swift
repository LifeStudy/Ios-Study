//
//  TasksTableViewHeader.swift
//  Tasky
//
//  Created by Giovanna Moeller on 28/05/24.
//

import UIKit

protocol TasksTableViewHeaderDelegate: AnyObject {
    func didTapAddTaskButton()
}

class TasksTableViewHeader: UIView {
    
    weak var delegate: TasksTableViewHeaderDelegate?
            
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tarefas"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = UIImage(systemName: "plus")
        button.setImage(plusImage, for: .normal)
        button.addTarget(self, action: #selector(didTapAddTaskButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func didTapAddTaskButton() {
        delegate?.didTapAddTaskButton()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
