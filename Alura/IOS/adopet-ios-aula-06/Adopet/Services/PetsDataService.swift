//
//  PetsDataService.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

protocol PetsDataServiceDelegate: AnyObject {
    func didFetchPetsSuccessfully(_ pets: [Pet])
    func didFailWithError(_ error: NetworkingError)
}

class PetsDataService {
    
    weak var delegate: PetsDataServiceDelegate?
    
    private var networkingService: NetworkingProtocol
    
    init(networkingService: NetworkingProtocol) {
        self.networkingService = networkingService
    }
    
    func fetchPets() {
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
        networkingService.request(url) { [weak self] (result: Result<[Pet], NetworkingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pets):
                    self?.delegate?.didFetchPetsSuccessfully(pets)
                case .failure(let failure):
                    self?.delegate?.didFailWithError(failure)
                }
            }
        }
    }
}
