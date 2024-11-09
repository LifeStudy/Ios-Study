//
//  ProductDetailsCoordinator.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

class ProductDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var product: Product
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController, product: Product) {
        self.navigationController = navigationController
        self.product = product
    }
    
    func start() {
        let productDetailsViewModel = ProductDetailsViewModel(product: product)
        let productDetailsViewController = ProductDetailsViewController(viewModel: productDetailsViewModel)
        navigationController.pushViewController(productDetailsViewController, animated: true)
    }
}
