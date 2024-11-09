//
//  ProductsListViewController.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 19/04/24.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    //private var products: [Product] = []
    //private var productsRepository: ProductsRepository
    private var cellDataSource: [ProductTableCellViewModel] = []
    
    private var viewModel: ProductsListViewModel
    
    weak var coordinator: ProductsListCoordinator?
    
    init(viewModel: ProductsListViewModel = ProductsListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(ProductsListTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        addSubviews()
        setupConstraints()
        bindViewModel()
        getProducts()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        view.frame = view.frame.inset(by: UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24))
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicatorView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func getProducts() {
        viewModel.getAllProducts()
        tableView.reloadData()
    }
    
    private func bindViewModel() {
        bindCellDataSource()
        bindLoading()
    }
    
    private func bindLoading() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicatorView.startAnimating()
                } else {
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
    
    private func bindCellDataSource() {
        viewModel.cellDataSource.bind { [weak self] cellDataSource in
            guard let self = self, let cellDataSource else { return }
            self.cellDataSource = cellDataSource
            self.tableView.reloadData()
        }
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsOfTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductsListTableViewCell else { return UITableViewCell() }
        let product = cellDataSource[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let product = viewModel.getProductById(id: cellDataSource[indexPath.row].productId) else { return }
        /*let productDetailsViewModel = ProductDetailsViewModel(product: product)
        let productDetailsVC = ProductDetailsViewController(viewModel: productDetailsViewModel)
        navigationController?.pushViewController(productDetailsVC, animated: true)*/
        coordinator?.showProductDetails(for: product)
    }
}
