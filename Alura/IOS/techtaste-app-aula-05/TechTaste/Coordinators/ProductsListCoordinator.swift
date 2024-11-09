//
//  ProductsListCoordinator.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class ProductsListCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productsListViewController = ProductsListViewController()
        productsListViewController.coordinator = self
        navigationController.pushViewController(productsListViewController, animated: true)
    }
    
    func showProductDetails(for product: Product) {
        let productDetailsCoordinator = ProductDetailsCoordinator(navigationController: navigationController, product: product)
        childCoordinators.append(productDetailsCoordinator)
        productDetailsCoordinator.start()
    }
}
