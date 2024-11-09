//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

class ProductsListViewModel {
    
    var products: Observable<[Product]> = Observable([])
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[ProductTableCellViewModel]> = Observable([])
    
    private var networkingManager: NetworkingManager
    
    init(networkingManager: NetworkingManager = NetworkingManager()) {
        self.networkingManager = networkingManager
    }
    
    func getAllProducts() {
        isLoading.value = true
        
        networkingManager.getProductsList { [weak self] result in
            guard let self else { return }
            self.isLoading.value = false
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products.value = products
                    self.cellDataSource.value = products.compactMap({ product in
                        ProductTableCellViewModel(product: product)
                    })
                }
            case .failure(let failure):
                print("Ocorreu um erro ao obter produtos: \(failure.localizedDescription)")
            }
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.value?.count ?? 0
    }
    
    func getProductById(id: Int) -> Product? {
        guard let product = products.value?.first(where: { element in
            element.id == id
        }) else { return nil }
        return product
    }
}
