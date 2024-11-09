//
//  ProductDetailsViewController.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var viewModel: ProductDetailsViewModel
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: viewModel.productImage))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.text = viewModel.productName
        label.textColor = UIColor(named: AssetsConstants.mediumOrange)
        return label
    }()
    
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .regular)
        label.text = viewModel.productDescription
        label.numberOfLines = 0
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.text = viewModel.productFormattedPrice
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
    }
    
    private func addSubviews() {
        view.addSubview(productImageView)
        view.addSubview(productTitleLabel)
        view.addSubview(productDescriptionLabel)
        view.addSubview(productPriceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 280),
            
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 32.0),
            productTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            productTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 32.0),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            
            productPriceLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 16.0),
            productPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            productPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
        ])
    }
    
}
