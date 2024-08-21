//
//  APLabeledTextField.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import UIKit

class APLabeledTextField: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Poppins", size: 16)
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .init(name: "Poppins", size: 16)
        textField.backgroundColor = UIColor(named: "ColorLightGray")
        textField.layer.cornerRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.25
        textField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        textField.layer.shadowRadius = 0
        textField.setLeftPaddingPoints(15)
        return textField
    }()
    
    private var title: String
    private var placeholder: String
    private var isSecureEntry: Bool
    
    init(title: String,
         placeholder: String,
         isSecureEntry: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self.isSecureEntry = isSecureEntry
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        updateUI()
        addSubviews()
        setupConstraints()
    }
    
    private func updateUI() {
        label.text = title
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureEntry
    }
    
    private func addSubviews() {
        addSubview(label)
        addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
